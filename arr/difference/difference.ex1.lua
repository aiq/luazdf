local t = require( "taptest" )
local difference = require( "difference" )
local same = require( "same" )

res = difference( { 1, 2, 3, 4, 5 }, { 5, 2, 10 } )
t( same( res, { 1, 3, 4 } ), true )

t()
