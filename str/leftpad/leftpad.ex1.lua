local t = require( "taptest" )
local leftpad = require( "leftpad" )

t( leftpad( "foo", 5 ), "  foo" )
t( leftpad( "foo", 3 ), "foo" )

t( leftpad( "foobar", 5 ), "foobar" )
t( leftpad( "foobar", 5, " ", true ), "fooba" )

t( leftpad( tostring( 1 ), 2, "0" ), "01" )

t()
