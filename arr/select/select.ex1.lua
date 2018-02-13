local t = require( "tapered" )
local select = require( "select" )

local iseven = require( "iseven" )

tab = { 1, 2, 3, 4, 5, 6, 7 }
selection = select( tab, iseven )
t.same( { 2, 4, 6 }, selection )

t.done()
