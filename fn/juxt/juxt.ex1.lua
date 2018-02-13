local t = require( "tapered" )
local juxt = require( "juxt" )

local j1 = juxt( function( v ) return v - 1 end,
                 function( v ) return v end,
                 function( v ) return v + 1 end )

t.same( { 2, 3, 4}, j1( 3 ) )

t.done()
