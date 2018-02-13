local t = require( "tapered" )
local sech = require( "sech" )
-- util functions
local round = require( "round" )

t.is( 0.8868189, round( sech( 0.5 ), 7 ) )

t.done()
