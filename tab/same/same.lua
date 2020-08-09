--ZFUNC-same-v1
local function same( tab, other ) --> res

   if type( tab ) ~= 'table' or type( other ) ~= 'table' then
      return tab == other
   end

   for k, v in pairs( tab ) do
      local otherVal = other[ k ]
      if otherVal == nil or not same( v, otherVal ) then
         return false
      end
   end

   for k, v in pairs( other ) do
      local tabVal = tab[ k ]
      if tabVal == nil or not same( v, tabVal ) then
         return false
      end
   end

   return true
end

return same
