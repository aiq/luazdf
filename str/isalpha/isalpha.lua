--ZFUNC-isalpha-v1
local function isalpha( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   local ba, bz = string.byte( "az", 1, 2 )
   local bA, bZ = string.byte( "AZ", 1, 2 )
   for idx = 1, n do
      local b = string.byte( str:sub( idx, idx ) )
      if b >= ba and b <= bz then
      elseif b >= bA and b <= bZ then
      else
         return false, idx
      end
   end

   return true
end

return isalpha
