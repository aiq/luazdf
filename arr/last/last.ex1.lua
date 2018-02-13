local t = require( "tapered" )
local last = require( "last" )

arr = { "w", "x", "y", "z" }
t.is( "z", last( arr ) )

t.done()
