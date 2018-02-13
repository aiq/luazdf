--ZFUNC-insertall-v1
local function insertall( arr, pos, oth ) --> arr
   if not oth then
      oth = pos
      pos = #oth + 1
   end

   for _, v in ipairs( oth ) do
      table.insert( arr, pos, v )
      pos = pos + 1
   end

   return arr
end

return insertall
