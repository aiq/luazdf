local t = require( "taptest" )
local fact = require( "fact" )

t( fact( 5 ), 120 )
t( fact( 1.9 ), 1 )
t( fact( 0 ), 1 )

t()
