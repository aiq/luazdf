local t = require( "tapered" )
local longextname = require( "longextname" )

t.is( ".html", longextname( "index.html" ) )
t.is( ".coffee.md", longextname( "index.coffee.md" ) )

t.is( "..", longextname( "index.." ) )
t.is( "", longextname( "index" ) )

t.is( ".index", longextname( ".index" ) )
t.is( ".index", longextname( "/.index" ) )

t.is( "", longextname( "abc.def/index" ) )

t.done()
