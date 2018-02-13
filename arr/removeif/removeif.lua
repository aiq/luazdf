--ZFUNC-removeif-v1
local function removeif( arr, fv, init ) --> removed
   init = init or 1
   local removed = {}
   local i = 1
   while i <= #arr do
      if fv( arr[ i ] ) then
         local r = table.remove( arr, i )
         table.insert( removed, r )
      else
         i = i+1
      end
   end
   return removed
end

return removeif
