local t = require( "taptest" )
local gtef = require( "gtef" )

func = gtef( 2 )

t( func( 3 ), true )
t( func( 2 ), true )
t( func( 1 ), false )

t()
