--ZFUNC-tobase64-v1
local function tobase64( str ) --> base64str
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
   local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"..
                    "abcdefghijklmnopqrstuvwxyz"..
                    "0123456789+/"
   local padMap = { "", "==", "=" }

   local bitTab = {}
   for i = 1, #str do
      local b = string.byte( str, i, i )
      local firstHalf = math.floor( b / 2 ^ 4 )
      local secondHalf = b - ( firstHalf * 2 ^ 4 )
      table.insert( bitTab, bitMap[ firstHalf + 1 ] )
      table.insert( bitTab, bitMap[ secondHalf + 1 ] )
   end
   local fullBitStr = table.concat( bitTab )
   local mod6 = #fullBitStr % 6
   if mod6 > 0 then
      fullBitStr = fullBitStr..string.rep( '0', 6 - mod6 )
   end

   local chunks = asciichunks( fullBitStr, 6 )
   local result = {}
   for _, value in ipairs( chunks ) do
      local pos = tonumber( value, 2 ) + 1
      table.insert( result, alphabet:sub( pos, pos ) )
   end

   local pad = padMap[ #str % 3 + 1 ]
   table.insert( result, pad )
   return table.concat( result )
end

return tobase64
