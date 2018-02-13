--ZFUNC-lastchar-v1
local function lastchar( str ) --> charstr
   return string.sub( str, #str )
end

return lastchar
