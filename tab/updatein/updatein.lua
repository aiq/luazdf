--ZFUNC-updatein-v1
local function updatein( tab, fv, ... )
   local path = { ... }

   local parent = nil
   local value = tab
   local key = nil
   for i, k in ipairs( path ) do
      if not value[ k ] and i ~= #path then
         value[ k ] = {}
      end
      parent = value
      value = value[ k ]
      key = k
   end

   parent[ key ] = fv( parent[ key ] )
end

return updatein
