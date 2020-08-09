local t = require( "taptest" )
local startswithany = require( "startswithany" )

str = "abcdef"
t( startswithany( str, { "def", "abc" } ), true )
t( startswithany( str, { "cba", "fed" } ), false )

t()
