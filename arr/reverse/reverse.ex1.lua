local t = require( "taptest" )
local reverse = require( "reverse" )
local same = require( "same" )

arr = reverse{ 1, 2, 3, 4, 5, 6, 7, 8, 9 }
t( same( arr, { 9, 8, 7, 6, 5, 4, 3, 2, 1 } ), true )

arr = reverse{}
t( same( arr, {} ), true )

arr = reverse{ 1 }
t( same( arr, { 1 } ), true )

arr = reverse{ 1, 2 }
t( same( arr, { 2, 1 } ), true )

arr = reverse{ 1, 2, 3 }
t( same( arr, { 3, 2, 1 } ), true )

arr = reverse{ 1, 2, 3, 4 }
t( same( arr, { 4, 3, 2, 1 } ), true )

t()
