--ZFUNC-tobase32hex-v1
local function tobase32hex( str ) --> hex32str
   --ZFUNC-asciichunks-v1
   local function asciichunks( str, length )
      length = length or 1
      local chunks = {}

      local i = 1
      local last = string.len( str )
      while i <= last do
         local j = i + length - 1
         table.insert( chunks, str:sub( i, j ) )
         i = i + length
      end

      return chunks
   end

   local bitMap = {
     "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
     "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
   }
   local alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
   local padMap = { "", "======", "====", "===", "=" }

   local bitTab = {}
   for i = 1, #str do
      local b = string.byte( str, i, i )
      local firstHalf = math.floor( b / 2 ^ 4 )
      local secondHalf = b - ( firstHalf * 2 ^ 4 )
      table.insert( bitTab, bitMap[ firstHalf + 1 ] )
      table.insert( bitTab, bitMap[ secondHalf + 1 ] )
   end
   local fullBitStr = table.concat( bitTab )
   local mod5 = #fullBitStr % 5
   if mod5 > 0 then
      fullBitStr = fullBitStr..string.rep( '0', 5 - mod5 )
   end

   local chunks = asciichunks( fullBitStr, 5 )
   local result = {}
   for _, value in ipairs( chunks ) do
      local pos = tonumber( value, 2 ) + 1
      table.insert( result, alphabet:sub( pos, pos ) )
   end

   local pad = padMap[ #str % 5 + 1 ]
   table.insert( result, pad )
   return table.concat( result )
end

return tobase32hex
