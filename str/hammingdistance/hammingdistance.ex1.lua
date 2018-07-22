local t = require( "taptest" )
local hammingdistance = require( "hammingdistance" )

-- https://en.wikipedia.org/wiki/Hamming_distance#Examples
t( hammingdistance( "karolin", "kathrin" ), 3 )
t( hammingdistance( "karolin", "kerstin" ), 3 )
t( hammingdistance( "1011101", "1001001" ), 2 )
t( hammingdistance( "2173896", "2233796" ), 3 )

t()
