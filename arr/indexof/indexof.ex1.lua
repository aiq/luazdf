local t = require( "tapered" )
local indexof = require( "indexof" )

arr = { 1, 2, 1, 2 }
t.is( 2, indexof( arr, 2 ) )
t.is( 4, indexof( arr, 2, 3 ) )
t.is( nil, indexof( arr, 3 ) )

t.done()
