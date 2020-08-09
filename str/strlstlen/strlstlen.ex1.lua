local t = require( "taptest" )
local strlstlen = require( "strlstlen" )

t( strlstlen{ "", "", "", "" }, 0 )
t( strlstlen{ "abc", "def", "", "gh" }, 8 )

t()
