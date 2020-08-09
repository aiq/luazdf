local t = require( "taptest" )
local round = require( "round" )
local sinh = require( "sinh" )

t( round( 2.868 * sinh( 0.0342 * 1.03 ), 7 ), 0.1010491 )

t()
