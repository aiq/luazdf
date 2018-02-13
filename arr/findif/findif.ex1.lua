local t = require( "tapered" )
local findif = require( "findif" )

local iseven = require( "iseven" )

value, pos = findif( { 1, 3, 2, 4 }, iseven )
t.is( 2, value )
t.is( 3, pos )

value, pos = findif( { 1, 2, 3, 16 }, iseven, 3 )
t.is( 16, value )
t.is( 4, pos )

value, pos = findif( { 3, 5, 7, 11 }, iseven )
t.is( nil, value )
t.is( nil, pos )

t.done()
