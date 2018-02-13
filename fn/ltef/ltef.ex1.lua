local t = require( "tapered" )
local ltef = require( "ltef" )

func = ltef( 2 )

t.nok( func( 3 ) )
t.ok( func( 2 ) )
t.ok( func( 1 ) )

t.done()
