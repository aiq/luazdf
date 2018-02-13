--ZFUNC-keys-v1
local function keys( tab ) --> arr
   local arr = {}

   for k, v in pairs( tab ) do
      table.insert( arr, k )
   end

   return arr
end

return keys
