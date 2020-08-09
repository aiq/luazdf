local t = require( "taptest" )
local append = require( "append" )
local same = require( "same" )

arr = append( { 2, 4 }, 8 )
t( same( arr, { 2, 4, 8 } ), true )

arr = append( { 2 }, 4, 8, 16 )
t( same( arr, { 2, 4, 8, 16 } ), true )

t()
