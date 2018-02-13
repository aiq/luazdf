local t = require( "tapered" )
local removerange = require( "removerange" )

arr = { 1, 2, 3, 4, 5, 6, 7 }
removed = removerange( arr, 6 )
t.same( { 1, 2, 3, 4, 5 }, arr )
t.same( { 6, 7 }, removed )

removed = removerange( arr, 2, 4 )
t.same( { 1, 5 }, arr )
t.same( { 2, 3, 4 }, removed )

t.done()
