local t = require( "tapered" )
local difference = require( "difference" )

res = difference( { 1, 2, 3, 4, 5 }, { 5, 2, 10 } )
t.same( { 1, 3, 4 }, res )

t.done()
