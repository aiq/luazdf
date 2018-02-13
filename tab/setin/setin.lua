--ZFUNC-setin-v1
local function setin( tab, val, ... )
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

   parent[ key ] = val
end

return setin
