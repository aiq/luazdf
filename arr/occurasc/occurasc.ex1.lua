local t = require( "tapered" )
local occurasc = require( "occurasc" )

local arr = { "a", "x", "r", "f", "i" }

t.ok( occurasc( arr, "a", "x", "r", "f", "i" ) )
t.ok( occurasc( arr, "a", "i" ) )
t.ok( occurasc( arr, "a", "r", "i" ) )
t.nok( occurasc( arr, "i", "a" ) )
t.nok( occurasc( arr, "x", "z" ) )

t.done()
