local t = require( "tapered" )
local startswith = require( "startswith" )

str = "abcdef"
t.ok( startswith( str, "abc" ) )
t.nok( startswith( str, "def" ) )

t.done()
