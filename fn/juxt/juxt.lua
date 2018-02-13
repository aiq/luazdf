--ZFUNC-juxt-v1
local function juxt( ... ) --> func
   local set = { ... }

   return function ( ... )
      local func = {}
      for _, f in ipairs( set ) do
         table.insert( func, f( ... ) )
      end
      return func
   end
end

return juxt
