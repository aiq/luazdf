local t = require( "taptest" )
local iseven = require( "iseven" )
local some = require( "some" )

t( some( { 1, 2, 3, 4 }, iseven ), true )
t( some( { 1, 3, 5, 7 }, iseven ), false )

t()
