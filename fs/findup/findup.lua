local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-isdir-v1
local function isdir( path ) --> res
   local mode = lfs.attributes( path, "mode" )
   if mode == "directory" then
      return true
   else
      return false
   end
end
--ZFUNC-dirhas-v1
local function dirhas( path, name, mode ) --> entrypath
   local modeval = lfs.attributes( path, "mode" )
   if modeval ~= "directory" then return nil end

   for entry in lfs.dir( path ) do
      if entry == name then
         local entrypath = path.."/"..entry

         if mode then
            local modeval = lfs.attributes( entrypath, "mode" )
            if modeval ~= mode then
               return nil
            end
         end

         return entrypath
      end
   end

   return nil
end
--ZFUNC-dirname-v1
local function dirname( path ) --> parent

   local i = #path
   local c = string.sub( path, i, i )
   if c == "/" and #path >= 1 then
      i = i - 1
      c = string.sub( path, i, i )
   end
   
   while i > 0 and c ~= "/" do
      i = i - 1
      c = string.sub( path, i, i )
   end

   if i == 0 then 
      return path
   elseif i == 1 then -- root case
      return string.sub( path, 1, 1 )
   else
      return string.sub( path, 1, i-1 )
   end
end
--ZFUNC-joinpath-v1
local function joinpath( tab )
   --ZFUNC-firstchar-v1
   local function firstchar( str )
      return string.sub( str, 1, 1 )
   end

   --ZFUNC-lastchar-v1
   local function lastchar( str )
      return string.sub( str, #str )
   end

   local rooted = false
   local tmptab = {}
   for k, s in ipairs( tab ) do
      if k == 1 and firstchar( s ) == "/" then
         rooted = true
      end

      if firstchar( s ) == "/" then
         s = s:sub( 2 )
      end
      if lastchar( s ) == "/" then
         s = s:sub( 1, #s - 1 )
      end

      if #s > 0 then
         table.insert( tmptab, s )
      end
   end

   if rooted then
      return "/"..table.concat( tmptab, "/" )
   end

   return table.concat( tmptab, "/" )
end
--ZFUNC-abspath-v1
local function abspath( path ) --> abs
   --ZFUNC-currentdir-v1
   local function currentdir()
      --ZFUNC-unixpath-v1
      local function unixpath( path )
         return path:gsub( "\\", "/" )
      end

      local path = lfs.currentdir()
      return unixpath( path )
   end

   return joinpath{ currentdir(), path }
end

--ZFUNC-findup-v1
local function findup( path, name, mode, depth ) --> entrypath
   if not isdir( path ) then return nil end

   local currdir = abspath( path )

   while not dirhas( currdir, name, mode ) do
      local parentdir = dirname( currdir )
      if parentdir == currdir then return nil end
      if depth then
         depth = depth-1
         if depth < 0 then return nil end
      end

      currdir = parentdir
   end

   return joinpath{ currdir, name }
end

return findup
