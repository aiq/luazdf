local t = require( "tapered" )
local zip = require( "zip" )

-- should work like the zip function from underscore.js
local res = zip{ { "moe", "larry", "curly" }, { 30, 40, 50 }, { true, false, false } }

t.is( 3, #res )

t.same( { "moe", 30, true }, res[ 1 ] )
t.same( { "larry", 40, false }, res[ 2 ] )
t.same( { "curly", 50, false }, res[ 3 ] )

t.done()
