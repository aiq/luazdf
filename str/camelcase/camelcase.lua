--ZFUNC-camelcase-v1
local function camelcase( strlst ) --> str
   --ZFUNC-cutstr-v1
   local function cutstr( str, n )
      return str:sub( 1, n ), str:sub( n + 1, #str )
   end

   local str = {}
   for i, v in ipairs( strlst ) do
      local left, right = cutstr( v, 1 )
      table.insert( str, string.upper( left ) )
      table.insert( str, string.lower( right ) )
   end
   return table.concat( str )
end

return camelcase
