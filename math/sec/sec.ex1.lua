local t = require( "tapered" )
local sec = require( "sec" )
-- util functions
local round = require( "round" )

t.is( 1.9035944, round( sec( 45 ), 7 ) )
t.is( 6.4829212, round( sec( 30 ), 7 ) )

t.done()
