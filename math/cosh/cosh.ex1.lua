local t = require( "taptest" )
local cosh = require( "cosh" )
local round = require( "round" )

t( round( cosh( 4 ), 6 ), 27.308233 )
t( round( cosh( math.exp( 1 ) ), 7 ), 7.6101251 )

t()
