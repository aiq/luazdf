local t = require( "taptest" )
local acosh = require( "acosh" )
local isnan = require( "isnan" )
local round = require( "round" )

t( acosh( 1 ), 0 )
t( round( acosh( 10 ), 7 ), 2.9932228 )
t( isnan( acosh( 0 ) ), true )

t()
