--ZFUNC-constantly-v1
local function constantly( ... ) --> func
   --ZFUNC-unwrap-v1
   local function unwrap( tab, i, j )
      local unpack = unpack or table.unpack
      return unpack( tab, i, j )
   end

   local res = { ... }
   return function ( ... )
      return unwrap( res )
   end
end

return constantly
