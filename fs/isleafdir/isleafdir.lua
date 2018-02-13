local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-isleafdir-v1
local function isleafdir( path ) --> res
   --ZFUNC-isdodd-v1
   local function isdodd( e )
      if e == "." or e == ".." then
         return true
      end

      return false
   end

   local mode = lfs.attributes( path, "mode" )
   if mode ~= "directory" then return false end

   for entry in lfs.dir( path ) do
      local entrypath = path.."/"..entry
      local mode = lfs.attributes( entrypath, "mode" )
      if mode == "directory" and not isdodd( entry ) then
         return false
      end
   end

   return true
end

return isleafdir
