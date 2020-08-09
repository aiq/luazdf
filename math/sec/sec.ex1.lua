local t = require( "taptest" )
local round = require( "round" )
local sec = require( "sec" )

t( round( sec( 45 ), 7 ), 1.9035944 )
t( round( sec( 30 ), 7 ), 6.4829212 )

t()
