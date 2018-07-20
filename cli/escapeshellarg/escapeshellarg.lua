local quote_function
--ZFUNC-escapeshellarg-v2
local function escapeshellarg( str ) --> esc

  local function posix_quote_argument(str)
    str = str:gsub( "[$`\"\\]", "\\%1" )
    return '"' .. str .. '"'
  end

  local function windows_quote_argument(str)
    str = str:gsub('[%%&\\^<>|]', '^%1')
    str = str:gsub('"', "\\%1")
    str = str:gsub('[ \t][ \t]*', '"%1"')
    return str
  end

  if not quote_function then
    quote_function = windows_quote_argument
    local shell = os.getenv('SHELL')
    if shell then
      if '/' == shell:sub(1,1) and 'sh' == shell:sub(-2, -1) then
        quote_function = posix_quote_argument
      end
    end
  end

  return quote_function(str)
end

return escapeshellarg
