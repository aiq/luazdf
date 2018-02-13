--ZFUNC-winpath-v1
local function winpath( path ) --> wpath
   return path:gsub( "/", "\\" )
end

return winpath
