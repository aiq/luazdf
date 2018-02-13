local t = require( "tapered" )
local tanh = require( "tanh" )
-- util functions
local round = require( "round" )

t.is( -0.964028, round( tanh( -2 ), 6 ) )
t.is( 0, round( tanh( 0 ), 1 ) )
t.is( 0.462117, round( tanh( 0.5 ), 6 ) )

t.done()
