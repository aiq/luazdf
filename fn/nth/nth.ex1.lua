local t = require( "taptest" )
local nth = require( "nth" )

func = nth( 2 )
t( func( "a", "b", "c" ), "b" )

t()
