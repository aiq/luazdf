local t = require( "taptest" )
local lcm = require( "lcm" )

t( lcm( 5, 2 ), 10 )
t( lcm( 24, 36 ), 72 )
t( lcm( 2, 3, 5 ), 30 )

t()
