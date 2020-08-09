local t = require( "taptest" )
local ltf = require( "ltf" )

func = ltf( 2 )

t( func( 3 ), false )
t( func( 2 ), false )
t( func( 1 ), true )

t()
