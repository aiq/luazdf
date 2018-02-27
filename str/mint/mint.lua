
-- MINimal Template

local function compat_env()
  if _VERSION ~= 'Lua 5.1' then
    return pairs(_ENV)
  else
    return pairs(getfenv())
  end
end

local function compat_load(string, environment)
  local chunkname = 'mint_script'
  local func, err
  if _VERSION ~= 'Lua 5.1' then
    func, err = load(string, chunkname, 't', environment)
  else
    func, err = loadstring(string, chunkname)
    if func then setfenv(func, environment) end
  end
  return func, err
end

--ZFUNC-mint-v1
local function mint(template, ename) --> res
  if not ename then ename = '_o' end
  local function expr(e) return ' ' .. ename .. '(' .. e .. ')' end

  -- Generate a script that expands the template
  local script = ''
  template:gsub('(.-)@(%b{})', function(text, code)
    script = script .. expr(string.format('%q', text))
    code = code:sub(2,#code-1)
    if code:match('^{.*}$') then
      script = script .. code:sub(2,#code-1)
    else
      script = script .. expr(code)
    end
  end)
  local text = template:match('^.*@%b{}(.-)$')
  if text then
    script = script .. expr(string.format('%q', text))
  end

  -- Return a function that executes the script with a custom environment
  return function(sandbox)
    local result = ''
    if 'table' ~= type(sandbox) then
      sandbox = {}
      for k,v in compat_env() do sandbox[k] = v end
    end
    sandbox[ename] = function(out) result = result .. out end
    local generate, err = compat_load(script, sandbox)
    if not generate or err then
      error(err .. '\nTemplate script: [[\n' .. script .. '\n]]')
    end
    generate()
    return result
  end
end

return mint

