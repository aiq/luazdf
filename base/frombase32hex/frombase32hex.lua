--ZFUNC-frombase32hex-v1
local function frombase32hex( hex32str, ignore ) --> str, err
   local bitMap = {
      ["0"]="00000", ["1"]="00001", ["2"]="00010", ["3"]="00011", ["4"]="00100",
      ["5"]="00101", ["6"]="00110", ["7"]="00111", ["8"]="01000", ["9"]="01001",
      A="01010", B="01011", C="01100", D="01101", E="01110", F="01111",
      G="10000", H="10001", I="10010", J="10011", K="10100", L="10101",
      M="10110", N="10111", O="11000", P="11001", Q="11010", R="11011",
      S="11100", T="11101", U="11110", V="11111"
   }
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then hex32str = hex32str:gsub( "["..ignore.."]", "" ) end
   hex32str = string.upper( hex32str )
   local bitTab = {}
   for i = 1, #hex32str do
      local c = string.sub( hex32str, i, i )
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

return frombase32hex
