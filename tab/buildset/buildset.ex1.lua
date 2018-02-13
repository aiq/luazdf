local t = require( "tapered" )
local buildset = require( "buildset" )

keywords = buildset{ "while", "end", "function", "local" }

t.ok( keywords[ "function" ] )
t.nok( keywords[ "class" ] )

t.done()
