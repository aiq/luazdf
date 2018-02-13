local t = require( "tapered" )
local cbrt = require( "cbrt" )
-- util functions
local round = require( "round" )

t.is( 3, cbrt( 27 ) )
t.is( -1, cbrt( -1 ) )
t.is( 0, cbrt( 0 ) )
t.is( 1, cbrt( 1 ) )

t.is( 1.2599210498949, round( cbrt( 2 ), 13 ) )

t.done()
