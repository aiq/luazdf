local t = require( "taptest" )
local sum = require( "sum" )

t( sum( 10, 10, 10 ), 30 )
t( sum( 20, -2, 3 ), 21 )

t()
