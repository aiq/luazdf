local t = require( "tapered" )
local leftpad = require( "leftpad" )

t.is( "  foo", leftpad( "foo", 5 ) )
t.is( "foo", leftpad( "foo", 3 ) )

t.is( "foobar", leftpad( "foobar", 5 ) )
t.is( "fooba", leftpad( "foobar", 5, " ", true ) )

t.is( "01", leftpad( tostring( 1 ), 2, 0 ) )

t.done()
