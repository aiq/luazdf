--ZFUNC-isxdigit-v1
local function isxdigit( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   local b0, b9 = string.byte( "09", 1, 2 )
   local ba, bf = string.byte( "af", 1, 2 )
   local bA, bF = string.byte( "AF", 1, 2 )
   for idx = 1, n do
      local b = string.byte( str:sub( idx, idx ) )
      if b >= b0 and b <= b9 then
      elseif b >= ba and b <= bf then
      elseif b >= bA and b <= bF then
      else
         return false, idx
      end
   end

   return true
end

return isxdigit
