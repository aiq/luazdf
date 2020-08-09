local t = require( "taptest" )
local round = require( "round" )
local tanh = require( "tanh" )

t( round( tanh( -2 ), 6 ), -0.964028 )
t( round( tanh( 0 ), 1 ), 0 )
t( round( tanh( 0.5 ), 6 ), 0.462117 )

t()
