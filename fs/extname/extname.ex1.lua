local t = require( "tapered" )
local extname = require( "extname" )

t.is( ".html", extname( "index.html" ) )
t.is( ".md", extname( "index.coffee.md" ) )

t.is( ".", extname( "index.." ) )
t.is( "", extname( "index" ) )

t.is( ".index", extname( ".index" ) )
t.is( ".index", extname( "/.index" ) )

t.is( "", extname( "abc.def/index" ) )

t.done()
