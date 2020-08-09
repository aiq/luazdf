local t = require( "taptest" )
local findif = require( "findif" )
local iseven = require( "iseven" )

value, pos = findif( { 1, 3, 2, 4 }, iseven )
t( value, 2 )
t( pos, 3 )

value, pos = findif( { 1, 2, 3, 16 }, iseven, 3 )
t( value, 16 )
t( pos, 4 )

value, pos = findif( { 3, 5, 7, 11 }, iseven )
t( value, nil )
t( pos, nil )

t()
