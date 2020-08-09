local t = require( "taptest" )
local atan2 = require( "atan2" )
local round = require( "round" )

t( round( atan2( 1, 1 ), 9 ), 0.785398163 )
t( round( atan2( -1, -1 ), 8 ),  -2.35619449 )
t( round( atan2( -1, -1 ) * 180 / math.pi, 0 ), -135 )
t( round( math.deg( atan2( -1, -1 ) ), 0 ), -135 )

t()
