local t = require( "tapered" )
local acosh = require( "acosh" )
-- util functions
local isnan = require( "isnan" )
local round = require( "round" )

t.is( 0, acosh( 1 ) )
t.is( 2.9932228, round( acosh( 10 ), 7 ) )
t.ok( isnan( acosh( 0 ) ) )

t.done()
