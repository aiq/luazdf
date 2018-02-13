local t = require( "tapered" )
local cosh = require( "cosh" )
-- util functions
local round = require( "round" )

t.is( 27.308233, round( cosh( 4 ), 6 ) )
t.is( 7.6101251, round( cosh( math.exp( 1 ) ), 7 ) )

t.done()
