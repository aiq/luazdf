local t = require( "taptest" )
local gtf = require( "gtf" )

func = gtf( 2 )

t( func( 3 ), true )
t( func( 2 ), false )
t( func( 1 ), false )

t()
