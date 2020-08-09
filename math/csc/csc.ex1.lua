local t = require( "taptest" )
local csc = require( "csc" )
local round = require( "round" )

t( round( csc( 15 ), 7 ), 1.5377806 )

t()
