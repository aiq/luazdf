local t = require( "tapered" )
local isfinite = require( "isfinite" )

t.ok( isfinite( 0.0 ) )
t.nok( isfinite( 1.0 / 0.0 ) )
t.nok( isfinite( -1.0 / 0.0 ) )
t.nok( isfinite( math.sqrt( -1.0 ) ) )

t.done()
