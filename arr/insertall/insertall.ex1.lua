local t = require( "tapered" )
local insertall = require( "insertall" )

t.same( { "a", "b", "c", "d" }, insertall( { "a", "b" }, { "c", "d" } ) )

arr = { 1, 2, 5 }
insertall( arr, 3, { 3, 4 } )
t.same( { 1, 2, 3, 4, 5 }, arr )

t.done()
