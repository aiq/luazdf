--ZFUNC-isalnum-v1
local function isalnum( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   local b0, b9 = string.byte( "09", 1, 2 )
   local ba, bz = string.byte( "az", 1, 2 )
   local bA, bZ = string.byte( "AZ", 1, 2 )
   for idx = 1, n do
      local b = string.byte( str:sub( idx, idx ) )
      if b >= b0 and b <= b9 then
      elseif b >= ba and b <= bz then
      elseif b >= bA and b <= bZ then
      else
         return false, idx
      end
   end

   return true
end

return isalnum
