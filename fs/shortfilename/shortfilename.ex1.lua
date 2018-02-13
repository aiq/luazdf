local t = require( "tapered" )
local shortfilename = require( "shortfilename" )

t.is( "index", shortfilename( "index.html" ) )
t.is( "index", shortfilename( "index.coffee.md" ) )

t.is( "index", shortfilename( "index.." ) )
t.is( "index", shortfilename( "index" ) )

t.is( "", shortfilename( ".index" ) )
t.is( "", shortfilename( "/.index" ) )

t.is( "index", shortfilename( "abc.def/index" ) )

t.done()
