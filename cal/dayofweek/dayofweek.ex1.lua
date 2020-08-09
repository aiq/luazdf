local t = require( "taptest" )
local dayofweek = require( "dayofweek" )

t( dayofweek( 2012, 4, 8 ), 7 ) -- Sunday
t( dayofweek( 1949, 5, 23 ), 1 ) -- Monday
t( dayofweek( 1789, 7, 14 ), 2 ) -- Tuesday
t( dayofweek( 1892, 1, 18 ), 1 ) -- Monday
t( dayofweek( 1989, 11, 9 ), 4 ) -- Thursday

t()
