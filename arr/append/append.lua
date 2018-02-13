--ZFUNC-append-v1
local function append( arr, v, ... ) --> arr
   table.insert( arr, v )
   if ... then
      for i, o in ipairs{ ... } do
         table.insert( arr, o )
      end
   end
   return arr
end

return append
