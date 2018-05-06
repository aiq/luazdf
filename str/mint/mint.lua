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
   local script = template:gsub( '(.-)@(%b{})([^@]*)',
     function( prefix, code, suffix )
        prefix = expr( string.format( '%q', prefix ) )
        suffix = expr( string.format( '%q', suffix ) )
        code = code:sub( 2, #code-1 )

        if code:match( '^{.*}$' ) then
           return prefix .. code:sub( 2, #code-1 ) .. suffix
        else
           return prefix .. expr( code ) .. suffix
        end
     end
   )

   -- The generator must be run only if at least one @{} was found
   local run_generator = ( script ~= template )

   -- Return a function that executes the script with a custom environment
   return function( sandbox )
    if not run_generator then return script end
    local expstr = ''
    if 'table' ~= type( sandbox ) then
      return nil, "mint generator requires a sandbox"
    end
    local oldout = sandbox[ ename ]
    sandbox[ ename ] = function( out ) expstr = expstr..tostring(out) end
    local generate, err = compat_load( script, sandbox )
    if not generate or err then
       sandbox[ ename ] = oldout
       return nil, err..'\nTemplate script: [[\n'..script..'\n]]'
    end
    local ok, err = pcall(generate)
    sandbox[ ename ] = oldout
    if not ok or err then
       return nil, err..'\nTemplate script: [[\n'..script..'\n]]'
    end
    return expstr
  end
end

return mint

