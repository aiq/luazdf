local t = require( "tapered" )
local nth = require( "nth" )

func = nth( 2 )
t.is( "b", func( "a", "b", "c" ) )

t.done()
