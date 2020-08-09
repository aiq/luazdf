local t = require( "taptest" )
local basename = require( "basename" )

path = "/foo/bar/baz/asdf/quux.html"
t( basename( path ), "quux.html" )
t( basename( path, ".html" ), "quux" )

t( basename( "quux.html" ), "quux.html" )
t( basename( "quux.html", ".html" ), "quux" )

t()
