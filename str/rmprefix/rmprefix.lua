--ZFUNC-rmprefix-v1
local function rmprefix( str, prefix ) --> nstr
   local prefixlen = string.len( prefix )
   local startsub = string.sub( str, 1, prefixlen )
   if startsub == prefix then
      return string.sub( str, prefixlen + 1 )
   else
      return str
   end
end

return rmprefix
