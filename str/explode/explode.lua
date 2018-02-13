--ZFUNC-explode-v1
local function explode( str, delimiter, limit ) --> strlst

   limit = limit or 4294967296
   if limit == 0 then limit = 1 end
   if limit == 1 then return { str } end

   local strlst = {}
   local position = 1
   local s, e = string.find( str, delimiter, position, true )
   local cond = function( s, i ) return s end
   if limit > 0 then
      cond = function( s, i ) return s and i < limit - 1 end
   end

   while cond( s, #strlst ) do
      table.insert( strlst, string.sub( str, position, s-1 ) )
      position = e + 1
      s, e = string.find( str, delimiter, position, true )
   end

   if position <= #str then
      table.insert( strlst, string.sub( str, position ) )
   end

   if position > #str then
      table.insert( strlst, "" )
   end

   if limit < 0 then
      for i = 1, math.abs( limit ) do
         table.remove( strlst )
      end
   end

   return strlst
end

return explode
