local t = require( "tapered" )
local lcm = require( "lcm" )

t.is( 10, lcm( 5, 2 ) )
t.is( 72, lcm( 24, 36 ) )
t.is( 30, lcm( 2, 3, 5 ) )

t.done()
