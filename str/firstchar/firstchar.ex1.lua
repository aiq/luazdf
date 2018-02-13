local t = require( "tapered" )
local firstchar = require( "firstchar" )

t.is( "a", firstchar( "abc" ) )
t.is( "", firstchar( "" ) )

t.done()
