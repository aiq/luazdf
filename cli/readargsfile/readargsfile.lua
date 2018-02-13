--ZFUNC-readargsfile-v1
local function readargsfile( filepath ) --> args, err
   --ZFUNC-appendall-v1
   local function appendall( arr, oth ) --> arr
      for _, v in ipairs( oth ) do
         table.insert( arr, v )
      end
      return arr
   end

   --ZFUNC-readlines-v1
   local function readlines( filepath )
      local f, err = io.open( filepath, "r" )
      if err then return nil, err end

      local strlst = {}
      for line in f:lines() do
         table.insert( strlst, line )
      end

      local res, err = f:close()
      if err then return nil, err end

      return strlst
   end

   --ZFUNC-rmprefix-v1
   local function rmprefix( str, prefix )
      local prefixlen = string.len( prefix )
      local startsub = string.sub( str, 1, prefixlen )
      if startsub == prefix then
         return string.sub( str, prefixlen + 1 )
      else
         return str
      end
   end

   --ZFUNC-shellsplit-v1
   local function shellsplit( line ) --> args
      --ZFUNC-trim-v1
      local function trim( str )
         local n = str:find( "%S" )
         return n and str:match( ".*%S" ) or ""
      end
      --ZFUNC-utf8codes-v1
      local function utf8codes( str )
         return str:gmatch( "[%z\1-\127\194-\244][\128-\191]*" )
      end

      local function isspace( str )
         return str == " " or str == "\t" or str == "\r" or str == "\n"
      end

      line = trim( line )

      local args = {}
      local buff = {}
      local escaped, doubleQ, singleQ, backQ = false, false, false, false

      for r in utf8codes( line ) do
         if escaped then-----------------------------------------------------------
            table.insert( buff, r )
            escaped = false

         elseif r == '\\' then-----------------------------------------------------
            if singleQ then
               table.insert( buff, r )
            else
               escaped = true
            end

         elseif isspace( r ) then--------------------------------------------------
            if singleQ or doubleQ or backQ then
               table.insert( buff, r )
            else
               table.insert( args, table.concat( buff ) )
               buff = {}
            end

         elseif r == "`" then------------------------------------------------------
            if singleQ or doubleQ then
               table.insert( buff, r )
            else
               backQ = not backQ
            end

         elseif r == '"' then------------------------------------------------------
            if singleQ or backQ then
               table.insert( buff, r )
            else
               doubleQ = not doubleQ
            end

         elseif r == "'" then------------------------------------------------------
            if doubleQ or backQ then
               table.insert( buff, r )
            else
               singleQ = not singleQ
            end

         else----------------------------------------------------------------------
            table.insert( buff, r )

         end
      end

      if #buff > 0 then table.insert( args, table.concat( buff ) ) end

      return args
   end

   local function appendtolast( tab, i, j )
      local val = tab[ #tab ] or ""
      val = val..i..j
      tab[ #tab ] = val
      return tab
   end

   local lines, err = readlines( filepath )
   if err then return nil, err end

   local args = {}

   for i, line in ipairs( lines ) do
      if #line == 0 then
         --we ignore empty lines
      elseif line:match( "^#" ) then
         --we ignore comments
      elseif line:match( "^$ " ) then
         appendall( args, shellsplit( rmprefix( line, "$ " ) ) )
      elseif line:match( "^| " ) then
         appendtolast( args, "", rmprefix( line, "| " ) )
      elseif line:match( "^|= " ) then
         appendtolast( args, "=", rmprefix( line, "|= " ) )
      elseif line:match( "^|s " ) then
         appendtolast( args, " ", rmprefix( line, "|s " ) )
      elseif line:match( "^|t " ) then
         appendtolast( args, "\t", rmprefix( line, "|t " ) )
      elseif line:match( "^|n " ) then
         appendtolast( args, "\n", rmprefix( line, "|n " ) )
      else
         table.insert( args, line )
      end
   end

   return args
end

return readargsfile
