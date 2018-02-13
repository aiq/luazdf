local t = require( "tapered" )
local rightpad = require( "rightpad" )

t.is( "foo  ", rightpad( "foo", 5 ) )
t.is( "foo", rightpad( "foo", 3 ) )

t.is( "foobar", rightpad( "foobar", 5 ) )
t.is( "fooba", rightpad( "foobar", 5, " ", true ) )

t.is( "1..", rightpad( tostring( 1 ), 3, "." ) )

t.done()
