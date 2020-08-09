local t = require( "taptest" )
local product = require( "product" )

t( product( 5, 15, 30 ), 2250 )
t( product( 5, 15, 30, 2 ), 4500 )

t()
