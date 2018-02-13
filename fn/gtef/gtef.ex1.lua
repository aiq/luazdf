local t = require( "tapered" )
local gtef = require( "gtef" )

func = gtef( 2 )

t.ok( func( 3 ) )
t.ok( func( 2 ) )
t.nok( func( 1 ) )

t.done()
