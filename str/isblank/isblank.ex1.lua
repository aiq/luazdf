local t = require( "tapered" )
local isblank = require( "isblank" )

t.ok( isblank( " \t " ) )

res, pos = isblank( "" )
t.nok( res )
t.is( 0, pos )

re, pos = isblank( " \n" )
t.nok( res )
t.is( 2, pos )

t.done()
