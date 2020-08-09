local t = require( "taptest" )
local map = require( "map" )
local same = require( "same" )

local res = map( { 1, 2, 3 }, function( v ) return v * 2 end )
t( same( res, { 2, 4, 6 } ), true )

t()
