--ZFUNC-endswith-v1
local function endswith( str, suffix ) --> res
   return string.sub( str, -string.len( suffix ) ) == suffix
end

return endswith
