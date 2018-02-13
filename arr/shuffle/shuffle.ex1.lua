local t = require( "tapered" )
local shuffle = require( "shuffle" )

local like = require( "like" )

local arr = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" }
t.ok( like( arr, shuffle( arr ) ) )

t.done()
