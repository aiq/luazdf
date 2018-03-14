--ZFUNC-logline-v1
local skip_lower_level = 25
local log_count = 0

local level_list =  {
  {25, 'ERROR'},
  {50, 'DEBUG'},
  {75, 'INFO'},
  {99, 'VERBOSE'},
}

local level_map

local function update_level_map()
  level_map = {}
  for k,v in ipairs(level_list) do
    level_map[ v[2] ] = v
  end
end

update_level_map()

local function logline(level, ...) --> logStr
  local n = select('#', ...)

  -- Classify log level
  local level_class
  if 'string' == type(level) then
    level_class = level_map[level:upper()]
    if level_class then level = level_class[1] end
  elseif 'number' == type(level) then
    local level_num = #level_list
    for k = 1, level_num do
      if k == level_num or level <= level_list[k][1] then
        level_class = level_list[k] 
        break
      end
    end
  else
    return nil, 'Invalid type for argument #1'
  end
  if not level_class then
    return nil, 'Invalid symbolic log level'
  end

  --  Single argument mode: set log level
  if n == 0 then
    skip_lower_level = level
    return
  end

  -- Multiple argument mode: generate log line

  -- Skip if the current log level is too small
  if skip_lower_level < level then
    return
  end
  log_count = log_count + 1

  -- Get info about the function in the correct stack position
  local d = debug.getinfo(2)
  local td = d
  local stackup = 2
  while true do
    local n = td.name
    if not n then break end
    n = n:lower()
    if  not n:match('log$')
    and not n:match('^log')
    and n ~= '' then
      break
    end
    stackup = stackup + 1
    td = debug.getinfo(stackup)
  end
  if td then d = td end

  -- Log line common part
  local logStr = os.date("%Y/%m/%d %H:%M:%S")..' '..os.clock()..' '
    .. log_count .. ' ' .. level_class[1] .. '.' ..level_class[2] .. ' '
    .. d.short_src:match('([^/\\]*)$') .. ':' .. d.currentline .. ' | '

  -- Append additional log info from arguments
  for m=1,n do
    logStr = logStr .. tostring(select(m, ...)) .. ' | '
  end

  return logStr
end

return logline

