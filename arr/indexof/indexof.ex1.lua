local t = require( "taptest" )
local indexof = require( "indexof" )

arr = { 1, 2, 1, 2 }
t( indexof( arr, 2 ), 2 )
t( indexof( arr, 2, 3 ), 4 )
t( indexof( arr, 3 ), nil )

t()
