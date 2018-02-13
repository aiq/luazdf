local t = require( "tapered" )
local atan2 = require( "atan2" )
-- util functions
local round = require( "round" )

t.is( 0.785398163, round( atan2( 1, 1 ), 9 ) )
t.is( -2.35619449, round( atan2( -1, -1 ), 8 ) )
t.is( -135, round( atan2( -1, -1 ) * 180 / math.pi, 0 ) )
t.is( -135, round( math.deg( atan2( -1, -1 ) ), 0 ) )

t.done()
