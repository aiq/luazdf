local t = require( "tapered" )
local sum = require( "sum" )

t.is( 30, sum( 10, 10, 10 ) )
t.is( 21, sum( 20, -2, 3 ) )

t.done()
