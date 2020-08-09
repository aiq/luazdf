local t = require( "taptest" )
local csch = require( "csch" )
local round = require( "round" )

t( round( csch( 1.5 ), 7 ), 0.4696424 )

t()
