local t = require( "tapered" )
local isxdigit = require( "isxdigit" )

t.ok( isxdigit( "0123456789abcdefABCDEF" ) )

res, pos = isxdigit( "" )
t.nok( res )
t.is( 0, pos )

res, pos = isxdigit( "abcdefghABCDEFGH" )
t.nok( res )
t.is( 7, pos )

res, pos = isxdigit( "ABCDEFGHabcdefgh" )
t.nok( res )
t.is( 7, pos )

t.done()
