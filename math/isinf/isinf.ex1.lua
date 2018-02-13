local t = require( "tapered" )
local isinf = require( "isinf" )

t.nok( isinf( 0.0 ) )
t.ok( isinf( 1.0 / 0.0 ) )
t.ok( isinf( -1.0 / 0.0 ) )
t.nok( isinf( math.sqrt( -1.0 ) ) )

t.done()
