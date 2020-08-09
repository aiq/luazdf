local t = require( "taptest" )
local coth = require( "coth" )
local round = require( "round" )

t( round( coth( 2 ), 7 ), 1.0373147 )

t()
