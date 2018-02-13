--ZFUNC-collectv-v1
local function collectv( ... ) --> arr
   local arr = {}
   for k, v in ... do
      table.insert( arr, v )
   end
   return arr
end

return collectv
