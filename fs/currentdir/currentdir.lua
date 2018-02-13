local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-currentdir-v1
local function currentdir() --> path
   --ZFUNC-unixpath-v1
   local function unixpath( path )
      return path:gsub( "\\", "/" )
   end

   local path = lfs.currentdir()
   return unixpath( path )
end

return currentdir
