local t = require( "taptest" )
local juxt = require( "juxt" )
local same = require( "same" )

local j1 = juxt( function( v ) return v - 1 end,
                 function( v ) return v end,
                 function( v ) return v + 1 end )

t( same( j1( 3 ), { 2, 3 ,4 } ), true )

t()
