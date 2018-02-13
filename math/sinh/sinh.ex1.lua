local t = require( "tapered" )
local sinh = require( "sinh" )
-- util functions
local round = require( "round" )

t.is( 0.1010491, round( 2.868 * sinh( 0.0342 * 1.03 ), 7 ) )

t.done()
