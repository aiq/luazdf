local t = require( "tapered" )
local matchesf = require( "matchesf" )

func = matchesf( "ab" )

t.ok( func( "abba" ) )
t.nok( func( "bbaa" ) )

t.done()
