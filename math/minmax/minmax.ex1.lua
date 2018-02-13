local t = require( "tapered" )
local minmax = require( "minmax" )

min, max = minmax( 1, 2, 3, 4, 5 )
t.is( 1, min )
t.is( 5, max )

min, max = minmax( 8, 1 )
t.is( 1, min )
t.is( 8, max )

min, max = minmax( 7 )
t.is( 7, min )
t.is( 7, max )

t.done()
