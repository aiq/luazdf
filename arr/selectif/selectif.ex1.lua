local t = require( "taptest" )
local iseven = require( "iseven" )
local selectif = require( "selectif" )
local same = require( "same" )

tab = { 1, 2, 3, 4, 5, 6, 7 }
selection = selectif( tab, iseven )
t( same( selection, { 2, 4, 6 } ), true )

t()
