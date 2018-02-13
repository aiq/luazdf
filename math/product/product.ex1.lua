local t = require( "tapered" )
local product = require( "product" )

t.is( 2250, product( 5, 15, 30 ) )
t.is( 4500, product( 5, 15, 30, 2 ) )

t.done()
