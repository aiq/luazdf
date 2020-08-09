local t = require( "taptest" )
local rightpad = require( "rightpad" )

t( rightpad( "foo", 5 ), "foo  " )
t( rightpad( "foo", 3 ), "foo" )

t( rightpad( "foobar", 5 ), "foobar" )
t( rightpad( "foobar", 5, " ", true ), "fooba" )

t( rightpad( tostring( 1 ), 3, "." ), "1.." )

t()
