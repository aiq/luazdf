--ZFUNC-rightpad-v1
local function rightpad( str, len, c, trunc ) --> str
   c = c or " "
   local r = len - #str
   if r > 0 then
      str = str..string.rep( c, r )
   end
   if trunc then
      str = str:sub( 1, len ) 
   end
   return str
end

return rightpad
