local t = require( "tapered" )
local clamp = require( "clamp" )

min = 2
max = 11

t.is( 2, clamp( 2, min, max ) )
t.is( 7, clamp( 7, min, max ) )
t.is( 11, clamp( 11, min, max ) )

t.is( 2, clamp( 1, min, max ) )
t.is( 11, clamp( 12, min, max ) )

t.done()
