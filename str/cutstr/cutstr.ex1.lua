local t = require( "taptest" )
local cutstr = require( "cutstr" )

left, right = cutstr( "abc", 2 )
t( left, "ab" )
t( right, "c" )

t()
