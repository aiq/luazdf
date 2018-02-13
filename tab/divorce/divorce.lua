--ZFUNC-divorce-v1
local function divorce( tab ) --> keys, values
   local keys = {}
   local values = {}

   for k, v in pairs( tab ) do
      table.insert( keys, k )
      table.insert( values, v )
   end

   return keys, values
end

return divorce
