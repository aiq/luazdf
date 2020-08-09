local t = require( "taptest" )
local ltef = require( "ltef" )

func = ltef( 2 )

t( func( 3 ), false )
t( func( 2 ), true )
t( func( 1 ), true )

t()
