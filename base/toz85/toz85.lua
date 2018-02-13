--ZFUNC-toz85-v1
local function toz85( str ) --> z85str
   local z85Encoder = "0123456789"..
                      "abcdefghijklmnopqrstuvwxyz"..
                      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"..
                      ".-:+=^!/*?&<>()[]{}@%$#"
   local errlen = "invalid length: %d - must be a multiple of 4" 

   if ( #str % 4 ) ~= 0 then return nil, string.format( errlen, #str ) end

   local result = {}

   local value = 0
   for i = 1, #str do
      local b = string.byte( str, i )
      value = ( value * 256 ) + b
      if ( i % 4 ) == 0 then
         local divisor = 85 * 85 * 85 * 85
         while divisor ~= 0 do
            local index = ( math.floor( value / divisor ) % 85 ) + 1
            table.insert( result, z85Encoder:sub( index, index ) )
            divisor = math.floor( divisor / 85 )
         end
         value = 0
      end
   end

   return table.concat( result )
end

return toz85
