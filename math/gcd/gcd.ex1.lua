local t = require( "taptest" )
local gcd = require( "gcd" )

t( gcd( 5, 2 ), 1 )
t( gcd( 24, 36 ), 12 )
t( gcd( 7, 1 ), 1 )
t( gcd( 5, 0 ), 5 )
t( gcd( 2, 3, 5 ), 1 )

t()
