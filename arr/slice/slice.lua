--ZFUNC-slice-v1
local function slice( tab, first, last ) --> sub
   local sub = {}
   local n = #tab

   first = first or 1
   last = last or n
   if last < 0 then
      last = n + last + 1
   elseif last > n then
      last = n
   end

   if first < 1 or first > n then
      return {}
   end

   for i = first, last do
      table.insert( sub, tab[ i ] )
   end
   
   return sub
end

return slice
