
-- MINimal Template

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
      for k,v in pairs(_ENV) do sandbox[k] = v end
    end
    sandbox[ename] = function(out) result = result .. out end
    local generate, err = load(script,'mint_script','t', sandbox)
    if not generate or err then
      error(err .. '\nTemplate script: [[\n' .. script .. '\n]]')
    end
    generate()
    return result
  end
end

return mint

