--ZFUNC-isreadable-v1
--
local function isreadable_single(path)
  local f = io.open(path, 'r')
  if not f then return false end
  f:close()
  return path
end

local function isreadable(...) --> readableStr
  for i = 1, select('#', ...) do
    local readableStr = isreadable_single(select(i, ...))
    if readableStr then return readableStr end
  end
  return false
end

return isreadable

