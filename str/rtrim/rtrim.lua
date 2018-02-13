--ZFUNC-rtrim-v1
local function rtrim( str ) --> nstr
   local n = str:find( "%S%s*$" )
   return n and str:sub( 1, n ) or ""
end

return rtrim
