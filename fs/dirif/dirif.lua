local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-dirif-v1
local function dirif( path, f ) --> iter
   local function yieldentry( path )
      for entry in lfs.dir( path ) do
         if f( entry ) then
            coroutine.yield( entry )
         end
      end
   end

   return coroutine.wrap( function() yieldentry( path ) end )
end

return dirif
