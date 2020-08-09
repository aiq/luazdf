local t = require( "taptest" )
local repeatedly = require( "repeatedly" )
local same = require( "same" )

local add = function( a, b ) return a + b end
t( same( repeatedly( 5, add, 2, 3 ), { 5, 5, 5, 5, 5 } ), true )

t()
