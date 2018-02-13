local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-dirmatch-v1
local function dirmatch( path, pattern ) --> iter
   local function yielddir( path )
      for entry in lfs.dir( path ) do
         if entry:find( pattern ) then
            coroutine.yield( entry )
         end
      end
   end

   return coroutine.wrap( function() yielddir( path ) end )
end

return dirmatch
