local t = require( "tapered" )
local csch = require( "csch" )
-- util functions
local round = require( "round" )

t.is( 0.4696424, round( csch( 1.5 ), 7 ) )

t.done()
