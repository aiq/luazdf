local t = require( "taptest" )
local atanh = require( "atanh" )
local round = require( "round" )

t( round( atanh( 0.76159416 ), 8 ), 1.00000001 )
t( round( atanh( -0.1 ), 9 ), -0.100335348 )

t()
