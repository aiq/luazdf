local t = require( "tapered" )
local fact = require( "fact" )

t.is( 120, fact( 5 ) )
t.is( 1, fact( 1.9 ) )
t.is( 1, fact( 0 ) )

t.done()
