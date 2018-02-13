local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-rmdirtree-v1
local function rmdirtree( path ) --> res, err
   --ZFUNC-isdodd-v1
   local function isdodd( e )
      if e == "." or e == ".." then
         return true
      end

      return false
   end
   
   for entry in lfs.dir( path ) do
      if not isdodd( entry ) then
         local entrypath = path.."/"..entry
         local mode = lfs.attributes( entrypath, "mode" )
         local res, err = true, nil
         if mode == "directory" then
            res, err = rmdirtree( entrypath )
         else
            res, err = os.remove( entrypath )
         end
         if err then return res, err end
      end
   end

   return os.remove( path )
end

return rmdirtree
