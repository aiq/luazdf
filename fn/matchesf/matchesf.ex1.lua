local t = require( "taptest" )
local matchesf = require( "matchesf" )

func = matchesf( "ab" )

t( func( "abba" ), true )
t( func( "bbaa" ), false )

t()
