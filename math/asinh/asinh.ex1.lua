local t = require( "tapered" )
local asinh = require( "asinh" )
-- util functions
local round = require( "round" )

t.is( -1.647231146, round( asinh( -2.5 ), 9 ) )
t.is( 2.99822295, round( asinh( 10 ), 8 ) )

t.done()
