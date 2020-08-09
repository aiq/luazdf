local t = require( "taptest" )
local cot = require( "cot" )
local round = require( "round" )

t( round( cot( 30 ), 5 ), -0.15612 )
t( round( cot( 45 ), 7 ), 0.6173696 )

t()
