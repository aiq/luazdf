local lfs = require( "lfs" )  --ZREQ-lfs
--ZFUNC-subdirs-v1
local function subdirs( path ) --> iter
   --ZFUNC-isdodd-v1
   local function isdodd( e )
      if e == "." or e == ".." then
         return true
      end

      return false
   end

   local function yielddir( path )
      for entry in lfs.dir( path ) do
         local entrypath = path.."/"..entry
         local mode = lfs.attributes( entrypath, "mode" )
         if mode == "directory" and not isdodd( entry ) then
            coroutine.yield( entry )
         end
      end
   end

   return coroutine.wrap( function() yielddir( path ) end )
end

return subdirs
