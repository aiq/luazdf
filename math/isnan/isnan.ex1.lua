local t = require( "taptest" )
local isnan = require( "isnan" )

t( isnan( 0.0 ), false )
t( isnan( 1.0 / 0.0 ), false )
t( isnan( -1.0 / 0.0 ), false )
t( isnan( math.sqrt( -1.0 ) ), true )

t()
