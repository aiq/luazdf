--ZFUNC-ltrim-v1
local function ltrim( str ) --> nstr
   local n = str:find( "%S" )
   return n and str:sub( n ) or ""
end

return ltrim
