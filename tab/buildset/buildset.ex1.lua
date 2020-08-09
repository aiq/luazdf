local t = require( "taptest" )
local buildset = require( "buildset" )

keywords = buildset{ "while", "end", "function", "local" }

t( keywords[ "function" ], true )
t( keywords[ "class" ], nil )

t()
