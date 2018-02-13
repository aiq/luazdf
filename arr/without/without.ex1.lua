local t = require( "tapered" )
local without = require( "without" )

t.same( { 2, 3, 4 }, without( { 1, 2, 1, 0, 3, 1, 4 }, 0, 1 ) )

t.done()
