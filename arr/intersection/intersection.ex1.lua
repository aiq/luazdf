local t = require( "taptest" )
local intersection = require( "intersection" )
local same = require( "same" )

arr = intersection( { 1, 2, 3, 4, 5 }, { 2, 3, 7, 8 } )
t( same( arr, { 2, 3 } ), true )

t()
