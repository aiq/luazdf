local t = require( "tapered" )
local isalpha = require( "isalpha" )

t.ok( isalpha( "abcABC" ) )

res, pos = isalpha( "" )
t.nok( res )
t.is( 0, pos )

res, pos = isalpha( "abc123ABC" )
t.nok( res )
t.is( 4, pos )

res, pos = isalpha( "abcABC-123" )
t.nok( res )
t.is( 7, pos )

t.done()
