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

return shellsplit
