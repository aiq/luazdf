local t = require( "taptest" )
local cutpath = require( "cutpath" )

dirname, basename = cutpath( "quux.html" )
t( dirname, "" )
t( basename, "quux.html" )

dirname, basename = cutpath( "/foo/bar/quux.html" )
t( dirname, "/foo/bar/" )
t( basename, "quux.html" )

t()
