local t = require( "tapered" )
local some = require( "some" )

local iseven = require( "iseven" )

t.ok( some( { 1, 2, 3, 4 }, iseven ) )
t.nok( some( { 1, 3, 5, 7 }, iseven ) )

t.done()
