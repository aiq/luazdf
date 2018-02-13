local t = require( "tapered" )
local slice = require( "slice" )

local tab = { "a", "b", "c", "d", "e" }
t.is( "bcde", table.concat( slice( tab, 2 ) ) )
t.is( "bcd", table.concat( slice( tab, 2, -2 ) ) )
t.is( "bc", table.concat( slice( tab, 2, 3 ) ) )

t.done()
