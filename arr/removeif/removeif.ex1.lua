local t = require( "taptest" )
local iseven = require( "iseven" )
local removeif = require( "removeif" )
local same = require( "same" )

arr = { 1, 2, 3, 4, 5, 6, 7 }
removed = removeif( arr, iseven )
t( same( arr, { 1, 3, 5, 7 } ), true )
t( same( removed, { 2, 4, 6 } ), true )

t()
