--ZFUNC-mint-v0
local function mint( template, ename ) --> ( sandbox ) --> expstr, err
   if not ename then ename = '_o' end
   local function expr(e) return ' '..ename..'('..e..')' end
   
   local function compat_load( str, env )
      local chunkname = 'mint_script'
      local func, err
      if _VERSION ~= 'Lua 5.1' then
         func, err = load( str, chunkname, 't', env )
      else
         func, err = loadstring( str, chunkname)
         if func then setfenv( func, env ) end
      end
      return func, err
   end

   -- Generate a script that expands the template
   local script = ''
   template:gsub( '(.-)@(%b{})', function( text, code )
      script = script..expr( string.format( '%q', text ) )
      code = code:sub( 2, #code-1 )
      if code:match( '^{.*}$' ) then
         script = script..code:sub( 2, #code-1 )
      else
         script = script..expr( code )
      end
   end )
   local text = template:match( '^.*@%b{}(.-)$' )
   if text then
      script = script..expr( string.format( '%q', text ) )
   end

   -- Return a function that executes the script with a custom environment
   return function( sandbox )
    local expstr = ''
    if 'table' ~= type( sandbox ) then
      return nil, "mint generator requires a sandbox"
    end
    sandbox[ ename ] = function( out ) expstr = expstr..out end
    local generate, err = compat_load( script, sandbox )
    if not generate or err then
       return nil, err..'\nTemplate script: [[\n'..script..'\n]]'
    end
    generate()
    return expstr
  end
end

return mint

