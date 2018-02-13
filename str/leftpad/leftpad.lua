--ZFUNC-leftpad-v1
local function leftpad( str, len, c, trunc ) --> str
   c = c or " "
   local r = len - #str
   if r > 0 then
      str = string.rep( c, r )..str
   end
   if trunc then
      str = str:sub( 1, len )
   end
   return str
end

return leftpad
