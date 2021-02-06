local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-unixpath-v1
local function unixpath( path )
   return path:gsub( "\\", "/" )
end
--ZFUNC-currentdir-v1
local function currentdir()
   local path = lfs.currentdir()
   return unixpath( path )
end
--ZFUNC-rootprefix-v1
local function rootprefix( path )
   local remote = path:match[[^//%w+/]] or path:match[[^\\%w+\]]
   if remote then return remote end

   local unix = path:sub( 1, 1 )
   if unix == "/" then return unix end

   local win = path:match[=[^[a-zA-Z]:[\/]]=]
   if win then return win end

   return ""
end
--ZFUNC-isabsolute-v1
local function isabsolute( path ) --> res
   return rootprefix( path ) ~= ""
end
--ZFUNC-firstchar-v1
local function firstchar( str )
   return string.sub( str, 1, 1 )
end
--ZFUNC-lastchar-v1
local function lastchar( str )
   return string.sub( str, #str )
end
--ZFUNC-joinpath-v1
local function joinpath( tab )
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
--ZFUNC-splitpath-v1
local function splitpath( path ) --> tab
   local tab = {}
   for token in string.gmatch( path, "[^/]+" ) do
      if #token > 0 then
         table.insert( tab, token )
      end
   end
   return tab
end
--ZFUNC-normpath-v1
local function normpath( dirty ) --> clean
   if dirty == "" then return "." end

   local rooted = dirty:sub( 1, 1 ) == "/"
   
   local dirtytab = splitpath( dirty )
   local cleantab = {}
   for k, v in ipairs( dirtytab ) do
      if v == "." then
      elseif v == ".." then
         table.remove( cleantab )
      elseif v == "" then
      else
         table.insert( cleantab, v )
      end
   end
  
   if rooted then
      return "/"..table.concat( cleantab, "/" )
   end

   return table.concat( cleantab, "/" )
end
--ZFUNC-abspath-v3
local function abspath( path ) --> abs
   if isabsolute( path ) then
      return normpath( path )
   end

   return normpath( joinpath{ currentdir(), path } )
end
--ZFUNC-relativepath-v2
local function relativepath( from, to ) --> path
   from = abspath( from )
   to = abspath( to )

   if from == to then return "." end

   local fromtab = splitpath( normpath( from ) )
   local totab = splitpath( normpath( to ) )

   local f = 1
   local t = 1
   while f <= #fromtab and
         t <= #totab and
         fromtab[ f ] == totab[ t ] do
      f = f+1
      t = t+1
   end

   local pathtab = {}
   for i = f, #fromtab do
      table.insert( pathtab, ".." )
   end
   for i = t, #totab do
      table.insert( pathtab, totab[ i ] )
   end

   if #pathtab == 0 then return "." end
   return table.concat( pathtab, "/" )
end

return relativepath
