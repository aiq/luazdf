local t = require( "taptest" )
local isfinite = require( "isfinite" )

t( isfinite( 0.0 ), true )
t( isfinite( 1.0 / 0.0 ), false )
t( isfinite( -1.0 / 0.0 ), false )
t( isfinite( math.sqrt( -1.0 ) ), false )

t()
