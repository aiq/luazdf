local t = require( "tapered" )
local appendall = require( "appendall" )

t.same( { "a", "b", "c", "d" }, appendall( { "a", "b" }, { "c", "d" } ) )

arr = { 1, 2, 3 }
appendall( arr, { 4, 5 } )
t.same( { 1, 2, 3, 4, 5 }, arr )

t.done()
