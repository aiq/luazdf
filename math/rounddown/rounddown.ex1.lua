local t = require( "tapered" )
local rounddown = require( "rounddown" )

t.is( 3, rounddown( 3.2, 0 ) )
t.is( 76, rounddown( 76.9, 0 ) )
t.is( 3.141, rounddown( 3.14159, 3 ) )
t.is( -3.1, rounddown( -3.14159, 1 ) )
t.is( 31400, rounddown( 31415.92654, -2 ) )

t.done()
