--ZFUNC-frombase32-v1
local function frombase32( base32str, ignore ) --> str, err
   local bitMap = {
      A="00000", B="00001", C="00010", D="00011", E="00100", F="00101",
      G="00110", H="00111", I="01000", J="01001", K="01010", L="01011",
      M="01100", N="01101", O="01110", P="01111", Q="10000", R="10001",
      S="10010", T="10011", U="10100", V="10101", W="10110", X="10111",
      Y="11000", Z="11001",
      ["2"]="11010", ["3"]="11011", ["4"]="11100",["5"]="11101", ["6"]="11110",
      ["7"]="11111"
   }
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then base32str = base32str:gsub( "["..ignore.."]", "" ) end
   base32str = string.upper( base32str )
   local bitTab = {}
   for i = 1, #base32str do
      local c = string.sub( base32str, i, i )
      if c ~= '=' then
         local bitStr = bitMap[ c ]
         if not bitStr then
            return nil, string.format( errchar, i, c )
         end
         table.insert( bitTab, bitStr )
      end
   end

   local fullBitStr = table.concat( bitTab )
   local len = #fullBitStr
   local pad = len % 8
   fullBitStr = string.sub( fullBitStr, 1, len - pad )
   return fullBitStr:gsub( '........', function ( cc )
      return string.char( tonumber( cc, 2 ) )
   end )
end

return frombase32
