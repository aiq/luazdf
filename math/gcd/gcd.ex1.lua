local t = require( "tapered" )
local gcd = require( "gcd" )

t.is( 1, gcd( 5, 2 ) )
t.is( 12, gcd( 24, 36 ) )
t.is( 1, gcd( 7, 1 ) )
t.is( 5, gcd( 5, 0 ) )
t.is( 1, gcd( 2, 3, 5 ) )

t.done()
