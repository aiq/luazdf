local lfs = require( "lfs" ) --ZREQ-lfs
--ZFUNC-mkpath-v1
local function mkpath( path ) --> res, err
   --ZFUNC-separator-v1
   local function separator()
      return _G.package.config:sub( 1, 1 )
   end

   --ZFUNC-splitpath-v1
   local function splitpath( path )
      local tab = {}
      for token in string.gmatch( path, "[^/]+" ) do
         if #token > 0 then
            table.insert( tab, token )
         end
      end
      return tab
   end

   local p = "."
   local res, err
   for i, name in ipairs( splitpath( path ) ) do
      p = p.."/"..name
      res, err = lfs.mkdir( p )

      if err then return res, err end
   end

   return true
end

return mkpath
