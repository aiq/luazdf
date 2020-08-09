local t = require( "taptest" )
local appendall = require( "appendall" )
local same = require( "same" )

arr = appendall( { "a", "b" }, { "c", "d" } )
t( same( arr, { "a", "b", "c", "d" } ), true )

arr = { 1, 2, 3 }
appendall( arr, { 4, 5 } )
t( same( arr, { 1, 2, 3, 4, 5 } ), true )

t()
