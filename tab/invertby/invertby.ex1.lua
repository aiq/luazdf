local t = require( "taptest" )
local invertby = require( "invertby" )
local like = require( "like" )

-- https://lodash.com/docs#invertBy
local tab = { a=1, b=2, c=1 }
local itab = invertby( tab )
t( like( itab[ 1 ], { "a", "c" } ), true )
t( like( itab[ 2 ], { "b" } ), true )
 
itab = invertby( tab, function( v ) return 'g'..v end )
t( like( itab.g1, { "a", "c" } ), true )
t( like( itab.g2, { "b" } ), true )
 
t()
