local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-argsfilesindir-v1
local function argsfilesindir( appname, dir ) --> defargs, filepaths
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
   --ZFUNC-endswith-v1
   local function endswith( str, suffix ) --> res
      return string.sub( str, -string.len( suffix ) ) == suffix
   end
   --ZFUNC-startswith-v1
   local function startswith( str, prefix ) --> res
      return string.sub( str, 1, string.len( prefix ) ) == prefix
   end

   dir = dir or "."

   local defargs = nil
   local filepaths = {}
   -- check for .args files in the working directory
   for filename in dirfiles( dir ) do
      if filename == appname..".auto.args" then
         defargs = filename
      elseif startswith( filename, appname ) and
         endswith( filename, ".args" ) then
         table.insert( filepaths, filename )
      end
   end
   if #filepaths > 0 then
      return defargs, filepaths
   end
   
   return defargs, nil
end

return argsfilesindir
