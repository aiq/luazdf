--ZFUNC-removerange-v1
local function removerange( arr, first, last ) --> removed
   last = last or #arr
   local removed = {}
   local i = 1
   while i <= last do
      if i >= first and i <= last then
         local r = table.remove( arr, i - #removed )
         table.insert( removed, r )
      end
      i = i+1
   end
   return removed
end

return removerange
