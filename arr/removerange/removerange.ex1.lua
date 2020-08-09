local t = require( "taptest" )
local removerange = require( "removerange" )
local same = require( "same" )

arr = { 1, 2, 3, 4, 5, 6, 7 }
removed = removerange( arr, 6 )
t( same( arr, { 1, 2, 3, 4, 5 } ), true )
t( same( removed, { 6, 7 } ), true )

removed = removerange( arr, 2, 4 )
t( same( arr, { 1, 5 } ), true )
t( same( removed, { 2, 3, 4 } ), true )

t()
