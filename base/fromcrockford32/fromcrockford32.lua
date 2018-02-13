--ZFUNC-fromcrockford32-v1
local function fromcrockford32( crock32str, ignore ) --> str, err
   local bitMap = {
      ["0"]="00000", ["1"]="00001", ["2"]="00010", ["3"]="00011", ["4"]="00100",
      ["5"]="00101", ["6"]="00110", ["7"]="00111", ["8"]="01000", ["9"]="01001",
      A="01010", B="01011", C="01100", D="01101", E="01110", F="01111",
      G="10000", H="10001", J="10010", K="10011", M="10100", N="10101",
      P="10110", Q="10111", R="11000", S="11001", T="11010", V="11011",
      W="11100", X="11101", Y="11110", Z="11111",
      O="00000", I="00001", L="00001"
   }
   local errchar = "unexpected character at position %d: '%s'"

   if ignore then crock32str = crock32str:gsub( "["..ignore.."]", "" ) end
   crock32str = string.upper( crock32str )
   local bitTab = {}
   for i = 1, #crock32str do
      local c = string.sub( crock32str, i, i )
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

return fromcrockford32
