local t = require( "tapered" )
local repeatedly = require( "repeatedly" )

local add = function( a, b ) return a + b end
t.same( { 5, 5, 5, 5, 5 }, repeatedly( 5, add, 2, 3 ) )

t.done()
