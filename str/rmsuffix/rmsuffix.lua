--ZFUNC-rmsuffix-v1
local function rmsuffix( str, suffix ) --> nstr
   local suffixlen = string.len( suffix )
   local endsub = string.sub( str, -suffixlen )
   if endsub == suffix then
      local n = string.len( str ) - suffixlen
      return string.sub( str, 1, n )
   else
      return str
   end
end

return rmsuffix
