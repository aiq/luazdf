local t = require( "tapered" )
local strlstlen = require( "strlstlen" )

t.is( 0, strlstlen{ "", "", "", "" } )
t.is( 8, strlstlen{ "abc", "def", "", "gh" } )

t.done()
