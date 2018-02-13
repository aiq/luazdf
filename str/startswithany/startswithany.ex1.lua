local t = require( "tapered" )
local startswithany = require( "startswithany" )

str = "abcdef"
t.ok( startswithany( str, { "def", "abc" } ) )
t.nok( startswithany( str, { "cba", "fed" } ) )

t.done()
