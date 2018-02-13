local t = require( "tapered" )
local trunc = require( "trunc" )

t.is( 0, trunc( 0.2 ) )
t.is( 0, trunc( 0.7 ) )

t.is( 0, trunc( -0.2 ) )
t.is( 0, trunc( -0.7 ) )

t.done()
