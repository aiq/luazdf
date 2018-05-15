local t = require( "tapered" )
local selectif = require( "selectif" )

local iseven = require( "iseven" )

tab = { 1, 2, 3, 4, 5, 6, 7 }
selection = selectif( tab, iseven )
t.same( { 2, 4, 6 }, selection )

t.done()
