--ZFUNC-frombase64url-v1
local function frombase64url( url64str, ignore ) --> str, err
   local bitMap = {
      A="000000", B="000001", C="000010", D="000011", E="000100", F="000101",
      G="000110", H="000111", I="001000", J="001001", K="001010", L="001011",
      M="001100", N="001101", O="001110", P="001111", Q="010000", R="010001",
      S="010010", T="010011", U="010100", V="010101", W="010110", X="010111",
      Y="011000", Z="011001",
      a="011010", b="011011", c="011100", d="011101", e="011110", f="011111",
      g="100000", h="100001", i="100010", j="100011", k="100100", l="100101",
      m="100110", n="100111", o="101000", p="101001", q="101010", r="101011",
      s="101100", t="101101", u="101110", v="101111", w="110000", x="110001",
      y="110010", z="110011",
      ["0"]="110100", ["1"]="110101", ["2"]="110110", ["3"]="110111",
      ["4"]="111000", ["5"]="111001", ["6"]="111010", ["7"]="111011",
      ["8"]="111100", ["9"]="111101", ["-"]="111110", ["_"]="111111"
   }
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then url64str = url64str:gsub( "["..ignore.."]", "" ) end
   local bitTab = {}
   for i = 1, #url64str do
      local c = string.sub( url64str, i, i )
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

return frombase64url
