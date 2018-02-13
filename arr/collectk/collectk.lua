--ZFUNC-collectk-v1
local function collectk( ... ) --> arr
   local arr = {}
   for v in ... do
      table.insert( arr, v )
   end
   return arr
end

return collectk
