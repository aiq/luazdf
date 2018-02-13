local t = require( "tapered" )
local flatten = require( "flatten" )

local res = flatten{ "a", { "b" }, { "c", { { "d" } } } }

t.is( 4, #res )

t.is( "a", res[ 1 ] )
t.is( "b", res[ 2 ] )
t.is( "c", res[ 3 ] )
t.is( "d", res[ 4 ] )

t.done()
