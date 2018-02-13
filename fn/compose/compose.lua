--ZFUNC-compose-v1
local function compose( ... ) --> func
   --ZFUNC-unwrap-v1
   local function unwrap( tab, i, j )
      local unpack = unpack or table.unpack
      return unpack( tab, i, j )
   end

   local functions = { ... }
   
   return function( ... )
      local res_arg = { ... }
      for i,f in ipairs( functions ) do
         res_arg = { f( unwrap( res_arg ) ) }
      end
      return unwrap( res_arg )
   end
end

return compose
