local t = require( "tapered" )
local coth = require( "coth" )
-- util functions
local round = require( "round" )

t.is( 1.0373147, round( coth( 2 ), 7 ) )

t.done()
