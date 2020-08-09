local t = require( "taptest" )
local insertall = require( "insertall" )
local same = require( "same" )

arr = insertall( { "a", "b" }, { "c", "d" } )
t( same( arr, { "a", "b", "c", "d" } ), true )

arr = { 1, 2, 5 }
insertall( arr, 3, { 3, 4 } )
t( same( arr, { 1, 2, 3, 4, 5 } ), true )

t()
