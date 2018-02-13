--ZFUNC-appendall-v1
local function appendall( arr, oth ) --> arr
   for _, v in ipairs( oth ) do
      table.insert( arr, v )
   end
   return arr
end

return appendall
