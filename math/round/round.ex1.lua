local t = require( "tapered" )
local round = require( "round" )

t.is( 2.2, round( 2.15, 1 ) )
t.is( 2.1, round( 2.149, 1 ) )
t.is( -1.48, round( -1.475, 2 ) )
t.is( 20, round( 21.5, -1 ) )
t.is( 1000, round( 626.3, -3 ) )
t.is( 0, round( 1.98, -1 ) )
t.is( -100, round( -50.55, -2 ) )

t.is( 0, round( 0, 2 ) )
t.is( 0, round( 0, -2 ) )

t.done()
