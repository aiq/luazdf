local t = require( "tapered" )
local acoth = require( "acoth" )
-- util functions
local isnan = require( "isnan" )
local round = require( "round" )

t.is( 0.168236118, round( acoth( 6 ), 9 ) )
t.ok( isnan( acoth( 0 ) ) )

t.done()
