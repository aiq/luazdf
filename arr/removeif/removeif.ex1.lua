local t = require( "tapered" )
local removeif = require( "removeif" )

local iseven = require( "iseven" )

arr = { 1, 2, 3, 4, 5, 6, 7 }
removed = removeif( arr, iseven )
t.same( { 1, 3, 5, 7 }, arr )
t.same( { 2, 4, 6 }, removed )

t.done()
