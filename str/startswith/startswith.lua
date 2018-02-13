--ZFUNC-startswith-v1
local function startswith( str, prefix ) --> res
   return string.sub( str, 1, string.len( prefix ) ) == prefix
end

return startswith
