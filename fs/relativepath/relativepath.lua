local lfs = require( "lfs" ) --ZREQ-lfs

--ZFUNC-relativepath-v1
local function relativepath( from, to ) --> path
   --ZFUNC-isabsolute-v1
   local function isabsolute( path )
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

      return rootprefix( path ) ~= ""
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
   --ZFUNC-abspath-v1
   local function abspath( path )
      --ZFUNC-currentdir-v1
      local function currentdir()
         --ZFUNC-unixpath-v1
         local function unixpath( path )
            return path:gsub( "\\", "/" )
         end

         local path = lfs.currentdir()
         return unixpath( path )
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

      return joinpath{ currentdir(), path }
   end
   --ZFUNC-normpath-v1
   local function normpath( dirty )

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

   if not isabsolute( from ) then from = abspath( from ) end
   if not isabsolute( to ) then to = abspath( to ) end

   if from == to then return "" end

   local fromtab = splitpath( from )
   local totab = splitpath( to )

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

   return table.concat( pathtab, "/" )
end

return relativepath
