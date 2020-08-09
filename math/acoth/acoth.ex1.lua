local t = require( "taptest" )
local acoth = require( "acoth" )
local isnan = require( "isnan" )
local round = require( "round" )

t( round( acoth( 6 ), 9 ), 0.168236118 )
t( isnan( acoth( 0 ) ), true )

t()
