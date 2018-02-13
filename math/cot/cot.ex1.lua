local t = require( "tapered" )
local cot = require( "cot" )
-- util functions
local round = require( "round" )

t.is( -0.15612, round( cot( 30 ), 5 ) )
t.is( 0.6173696, round( cot( 45 ), 7 ) )

t.done()
