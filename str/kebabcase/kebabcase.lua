--ZFUNC-kebabcase-v1
local function kebabcase( strlst ) --> str
   local str = {}
   for i, v in ipairs( strlst ) do
      table.insert( str, string.lower( v ) )
   end
   return table.concat( str, "-" )
end

return kebabcase
