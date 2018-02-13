local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-dirtree-v1
local function dirtree( dir ) --> iter
   --ZFUNC-isdodd-v1
   local function isdodd( e )
      if e == "." or e == ".." then
         return true
      end

      return false
   end

   assert( dir and dir ~= "", "directory parameter is missing or empty" )
   if string.sub( dir, -1 ) == "/" then
      dir = string.sub( dir, 1, -2 )
   end

   local function yieldtree( dir )
      for base in lfs.dir( dir ) do
         if not isdodd( base ) then
            entry = dir.."/"..base
            local mode = lfs.attributes( entry, "mode" )
            coroutine.yield( dir, base )
            if mode == "directory" then
               yieldtree( dir.."/"..base )
            end
         end
      end
   end

   return coroutine.wrap( function() yieldtree( dir ) end )
end

return dirtree
