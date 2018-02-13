local t = require( "tapered" )
local iseven = require( "iseven" )

t.ok( iseven( 98 ) )
t.ok( iseven( 2 ) )
t.ok( iseven( 0 ) )
t.ok( iseven( -4 ) )

t.nok( iseven( 99 ) )
t.nok( iseven( 1 ) )
t.nok( iseven( -3 ) )

t.nok( iseven( 7.3 ) )

t.done()
