local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-mkdirtree-v1
local function mkdirtree( tree, root ) --> res, err
   --ZFUNC-writefile-v1
   local function writefile( filename, ... )
      local f, err = io.open( filename, "w" )
      if err then return nil, err end

      local wres, err = f:write( ... )
      if err then return nil, err end

      return f:close()
   end

   root = root or "."

   for name, v in pairs( tree ) do
      local path = root.."/"..name
      local res, err
      if type( v ) == "table" then
         lfs.mkdir( path )
         res, err = mkdirtree( v, path )
      elseif type( v ) == "string" then
         local res, err = writefile( path, v )
      else
         res = nil
         err = string.format( "invalid value type: %q", type( v ) )
      end

      if err then return res, err end
   end

   return true
end

return mkdirtree

