local t = require( "tapered" )
local cutarr = require( "cutarr" )

left, right = cutarr( { "a", "b", "c" }, 2 )
t.same( { "a", "b" }, left )
t.same( { "c" }, right )

t.done()
