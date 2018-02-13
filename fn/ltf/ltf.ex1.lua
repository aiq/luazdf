local t = require( "tapered" )
local ltf = require( "ltf" )

func = ltf( 2 )

t.nok( func( 3 ) )
t.nok( func( 2 ) )
t.ok( func( 1 ) )

t.done()
