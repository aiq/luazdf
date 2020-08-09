local t = require( "taptest" )
local pathedges = require( "pathedges" )
local same = require( "same" )

t( same( pathedges{}, {} ), true )
t( same( pathedges{ "a" }, {} ), true )
t( same( pathedges{ "a", "b" }, { { "a", "b" } } ), true )
t( same( pathedges{ "a", "b", "c" }, { { "a", "b" }, { "b", "c" } } ), true )

t()
