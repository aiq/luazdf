local t = require( "taptest" )
local startswith = require( "startswith" )

str = "abcdef"
t( startswith( str, "abc" ), true )
t( startswith( str, "def" ), false )

t()
