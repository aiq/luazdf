--ZFUNC-snakecase-v1
local function snakecase( strlst ) --> str
   local str = {}
   for i, v in ipairs( strlst ) do
      table.insert( str, string.lower( v ) )
   end
   return table.concat( str, "_" )
end

return snakecase
