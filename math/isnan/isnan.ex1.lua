local t = require( "tapered" )
local isnan = require( "isnan" )

t.nok( isnan( 0.0 ) )
t.nok( isnan( 1.0 / 0.0 ) )
t.nok( isnan( -1.0 / 0.0 ) )
t.ok( isnan( math.sqrt( -1.0 ) ) )

t.done()
