local t = require( "taptest" )
local cbrt = require( "cbrt" )
local round = require( "round" )

t( cbrt( 27 ), 3 )
t( cbrt( -1 ), -1 )
t( cbrt( 0 ), 0 )
t( cbrt( 1 ), 1 )

t( round( cbrt( 2 ), 13 ), 1.2599210498949 )

t()
