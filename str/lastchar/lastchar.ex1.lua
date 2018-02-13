local t = require( "tapered" )
local lastchar = require( "lastchar" )

t.is( "c", lastchar( "abc" ) )
t.is( "", lastchar( "" ) )

t.done()
