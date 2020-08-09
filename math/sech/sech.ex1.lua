local t = require( "taptest" )
local round = require( "round" )
local sech = require( "sech" )

t( round( sech( 0.5 ), 7 ), 0.8868189 )

t()
