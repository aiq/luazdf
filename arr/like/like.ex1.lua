local t = require( "taptest" )
local like = require( "like" )

t( like( { "a", "b", "c" }, { "b", "c", "a" } ), true )
t( like( { "a", "c", "c" }, { "c", "c", "a" } ), true )
t( like( { "a", "b", "c" }, { "a", "b", "d" } ), false )

t()
