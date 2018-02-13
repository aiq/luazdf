local t = require( "tapered" )
local eqf = require( "eqf" )

func = eqf( "foo" )

t.ok( func( "foo" ) )
t.nok( func( "bar" ) )

t.done()
