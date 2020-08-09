local t = require( "taptest" )
local eqf = require( "eqf" )

func = eqf( "foo" )

t( func( "foo" ), true )
t( func( "bar" ), false )

t()
