local t = require( "tapered" )
local map = require( "map" )

t.same( { 2, 4, 6 }, map( { 1, 2, 3 }, function( v ) return v * 2 end ) )

t.done()
