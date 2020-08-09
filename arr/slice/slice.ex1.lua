local t = require( "taptest" )
local slice = require( "slice" )

local tab = { "a", "b", "c", "d", "e" }
t( table.concat( slice( tab, 2 ) ), "bcde" )
t( table.concat( slice( tab, 2, -2 ) ), "bcd" )
t( table.concat( slice( tab, 2, 3 ) ), "bc" )

t()
