local t = require( "taptest" )
local asinh = require( "asinh" )
local round = require( "round" )

t( round( asinh( -2.5 ), 9 ), -1.647231146 )
t( round( asinh( 10 ), 8 ), 2.99822295 )

t()
