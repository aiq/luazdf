local t = require( "tapered" )
local intersection = require( "intersection" )

arr = intersection( { 1, 2, 3, 4, 5 }, { 2, 3, 7, 8 } )
t.same( { 2, 3 }, arr )

t.done()
