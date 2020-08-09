local t = require( "taptest" )
local cutarr = require( "cutarr" )
local same = require( "same" )

left, right = cutarr( { "a", "b", "c" }, 2 )
t( same( left, { "a", "b" } ), true )
t( same( right, { "c" } ), true )

t()
