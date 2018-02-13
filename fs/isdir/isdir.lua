local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-isdir-v1
local function isdir( path ) --> res
   local mode = lfs.attributes( path, "mode" )
   if mode == "directory" then
      return true
   else
      return false
   end
end

return isdir
