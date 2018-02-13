local t = require( "tapered" )
local cutpath = require( "cutpath" )

dirname, basename = cutpath( "quux.html" )
t.is( "", dirname )
t.is( "quux.html", basename )

dirname, basename = cutpath( "/foo/bar/quux.html" )
t.is( "/foo/bar/", dirname )
t.is( "quux.html", basename )

t.done()
