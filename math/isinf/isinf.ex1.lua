local t = require( "taptest" )
local isinf = require( "isinf" )

t( isinf( 0.0 ), false )
t( isinf( 1.0 / 0.0 ), true )
t( isinf( -1.0 / 0.0 ), true )
t( isinf( math.sqrt( -1.0 ) ), false )

t()
