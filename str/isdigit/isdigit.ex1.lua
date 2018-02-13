local t = require( "tapered" )
local isdigit = require( "isdigit" )

t.ok( isdigit( "0123456789" ) )

res, pos = isdigit( "" )
t.nok( res )
t.is( 0, pos )

res, pos = isdigit( "01234v6789" )
t.nok( res )
t.is( 6, pos )

t.done()
