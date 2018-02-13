local t = require( "tapered" )
local basename = require( "basename" )

path = "/foo/bar/baz/asdf/quux.html"
t.is( "quux.html", basename( path ) )
t.is( "quux", basename( path, ".html" ) )

t.is( "quux.html", basename( "quux.html" ) )
t.is( "quux", basename( "quux.html", ".html" ) )

t.done()
