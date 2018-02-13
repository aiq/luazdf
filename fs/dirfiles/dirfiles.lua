local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-dirfiles-v1
local function dirfiles( path ) --> iter
   local function yielddir( path )
      for entry in lfs.dir( path ) do
         local entrypath = path.."/"..entry
         local mode = lfs.attributes( entrypath, "mode" )
         if mode == "file" then
            coroutine.yield( entry )
         end
      end
   end

   return coroutine.wrap( function() yielddir( path ) end )
end

return dirfiles
