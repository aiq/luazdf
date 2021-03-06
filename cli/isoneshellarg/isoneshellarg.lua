--ZFUNC-isoneshellarg-v1
local function isoneshellarg( str ) --> res
   --ZFUNC-utf8codes-v1
   local function utf8codes( str )
      return str:gmatch( "[%z\1-\127\194-\244][\128-\191]*" )
   end

   local function isspace( str )
      return str == " " or str == "\t" or str == "\r" or str == "\n"
   end

   local inbuff = false
   local escaped, doubleQ, singleQ, backQ = false, false, false, false

   for r in utf8codes( str ) do
      if escaped then-----------------------------------------------------------
         inbuff = true
         escaped = false

      elseif r == '\\' then-----------------------------------------------------
         if singleQ then inbuff = true
         else escaped = true
         end

      elseif isspace( r ) then--------------------------------------------------
         if singleQ or doubleQ or backQ then inbuff = true
         else return false
         end

      elseif r == "`" then------------------------------------------------------
         if singleQ or doubleQ then inbuff = true
         else backQ = not backQ
         end

      elseif r == '"' then------------------------------------------------------
         if singleQ or backQ then inbuff = true
         else doubleQ = not doubleQ
         end

      elseif r == "'" then------------------------------------------------------
         if doubleQ or backQ then inbuff = true
         else singleQ = not singleQ
         end

      else----------------------------------------------------------------------
         inbuff = true

      end
   end

   if escaped or doubleQ or singleQ or backQ then return false end

   if inbuff then return true end

   return false --no argument
end

return isoneshellarg
