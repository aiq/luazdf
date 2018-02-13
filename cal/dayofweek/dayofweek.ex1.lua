local t = require( "tapered" )
local dayofweek = require( "dayofweek" )

t.is( 7, dayofweek( 2012, 4, 8 ) ) -- Sunday
t.is( 1, dayofweek( 1949, 5, 23 ) ) -- Monday
t.is( 2, dayofweek( 1789, 7, 14 ) ) -- Tuesday
t.is( 1, dayofweek( 1892, 1, 18 ) ) -- Monday
t.is( 4, dayofweek( 1989, 11, 9 ) ) -- Thursday

t.done()
