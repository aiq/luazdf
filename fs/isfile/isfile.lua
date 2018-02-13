local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-isfile-v1
local function isfile( path ) --> res
   local attr = lfs.attributes( path )
   if attr.mode == "file" then return true
   else return false end
end

return isfile

