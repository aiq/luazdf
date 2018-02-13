--ZFUNC-trim-v1
local function trim( str ) --> nstr
   local n = str:find( "%S" )
   return n and str:match( ".*%S", n ) or ""
end

return trim
