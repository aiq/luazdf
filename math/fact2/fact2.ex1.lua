local t = require( "tapered" )
local fact2 = require( "fact2" )

t.is( 48, fact2( 6 ) )
t.is( 105, fact2( 7 ) )
t.is( 1, fact2( 0 ) )

t.done()
