local t = require( "tapered" )
local atanh = require( "atanh" )
-- util functions
local round = require( "round" )

t.is( 1.00000001, round( atanh( 0.76159416 ), 8 ) )
t.is( -0.100335348, round( atanh( -0.1 ), 9 ) )

t.done()
