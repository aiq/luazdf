--ZFUNC-isdigit-v1
local function isdigit( str ) --> res, idx
   local n = #str
   if n == 0 then return false, 0 end

   local b0, b9 = string.byte( "09", 1, 2 )
   for idx = 1, n do
      local b = string.byte( str:sub( idx, idx ) )
      if b < b0 or b > b9 then
         return false, idx
      end
   end

   return true
end

return isdigit
