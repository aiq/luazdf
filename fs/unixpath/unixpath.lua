--ZFUNC-unixpath-v1
local function unixpath( path ) --> upath
   return path:gsub( "\\", "/" )
end

return unixpath
