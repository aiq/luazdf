local t = require( "taptest" )
local minmax = require( "minmax" )

min, max = minmax( 1, 2, 3, 4, 5 )
t( min, 1 )
t( max, 5 )

min, max = minmax( 8, 1 )
t( min, 1 )
t( max, 8 )

min, max = minmax( 7 )
t( min, 7 )
t( max, 7 )

t()
