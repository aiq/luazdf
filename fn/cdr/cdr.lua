--ZFUNC-cdr-v1
local function cdr( arr ) --> tail
   if not arr then return nil end
   
   local n = #arr
   if n <= 1 then return nil end

   local tail = {}
   for i = 2, n do
      table.insert( tail, arr[ i ] )
   end
   return tail
end

return cdr
