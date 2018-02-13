--ZFUNC-cddr-v1
local function cddr( arr ) --> tail
   if not arr then return nil end

   local n = #arr
   if n <= 2 then return nil end

   local tail = {}
   for i = 3, n do
      table.insert( tail, arr[ i ] )
   end
   return tail
end

return cddr
