local t = require( "tapered" )
local isalnum = require( "isalnum" )

t.ok( isalnum( "abc123ABC" ) )

res, pos = isalnum( "" )
t.nok( res )
t.is( 0, pos )

res, pos = isalnum( "abc 123 ABC" )
t.nok( res )
t.is( 4, pos )

res, pos = isalnum( "abc123-ABC" )
t.nok( res )
t.is( 7, pos )

t.done()
