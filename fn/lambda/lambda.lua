--ZFUNC-lambda-v0
local function lambda( def ) --> func, err
   -- Compatibility wrapper
   local function compat_load( chunk )
      local chunkname = "lambda"
      if _VERSION ~= "Lua 5.1" then
         return load( chunk, chunkname, "t" )
      else
         return loadstring( chunk, chunkname )
      end
   end

   -- Find the body and symbolic arguments
   local symb, body = def:match( "^(.-)|(.*)$" )
   if not arg or not body then
      symb = "a,b,c,d,e,f,..."
      body = def
   end

   -- Split statements from the last expression
   local stat, expr = body:match( "^(.*;)([^;]*)$" )

   -- Generate standard lua function definition
   local func = "return( function( "..symb..")"
   if not expr or expr == "" then
      func = func.."return "..body
   else
      func = func..stat.."return "..expr
   end
   func = func.." end )( ... )"

   -- Generate the function
   return compat_load( func )
end

return lambda
