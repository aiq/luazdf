local t = require( "taptest" )
local fact2 = require( "fact2" )

t( fact2( 6 ), 48 )
t( fact2( 7 ), 105 )
t( fact2( 0 ), 1 )

t()
