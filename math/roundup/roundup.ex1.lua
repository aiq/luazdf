local t = require( "tapered" )
local roundup = require( "roundup" )

t.is( 4, roundup( 3.2, 0 ) )
t.is( 77, roundup( 76.9, 0 ) )
t.is( 3.142, roundup( 3.14159, 3 ) )
t.is( -3.2, roundup( -3.14159, 1 ) )
t.is( 31500, roundup( 31415.92654, -2 ) )

t.done()
