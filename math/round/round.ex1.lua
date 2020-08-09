local t = require( "taptest" )
local round = require( "round" )

t( round( 2.15, 1 ), 2.2 )
t( round( 2.149, 1 ), 2.1 )
t( round( -1.475, 2 ), -1.48 )
t( round( 21.5, -1 ), 20 )
t( round( 626.3, -3 ), 1000 )
t( round( 1.98, -1 ), 0 )
t( round( -50.55, -2 ), -100 )

t( round( 0, 2 ), 0 )
t( round( 0, -2 ), 0 )

t()
