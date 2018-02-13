local t = require( "tapered" )
local normpath = require( "normpath" )

t.is( "a/c", normpath( "a/c" ) )
t.is( "a/c", normpath( "a//c" ) )
t.is( "a/c", normpath( "a/c/." ) )
t.is( "a/c", normpath( "a/c/b/.." ) )
t.is( "/a/c", normpath( "/../a/c" ) )
t.is( "/a/c", normpath( "/../a/b/../././/c" ) )

t.is( "C:/a/b/c", normpath( "C:/a/b_/../b/c_/d_/../.././c" ) )

t.done()
