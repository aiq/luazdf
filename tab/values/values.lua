--ZFUNC-values-v1
local function values( tab ) --> arr
   local arr = {}

   for k, v in pairs( tab ) do
      table.insert( arr, v )
   end

   return arr
end

return values
