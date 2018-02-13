local t = require( "tapered" )
local csc = require( "csc" )
-- util functions
local round = require( "round" )

t.is( 1.5377806, round( csc( 15 ), 7 ) )

t.done()
