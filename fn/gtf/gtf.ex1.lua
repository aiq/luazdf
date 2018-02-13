local t = require( "tapered" )
local gtf = require( "gtf" )

func = gtf( 2 )

t.ok( func( 3 ) )
t.nok( func( 2 ) )
t.nok( func( 1 ) )

t.done()
