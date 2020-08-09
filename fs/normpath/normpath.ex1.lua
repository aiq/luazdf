local t = require( "taptest" )
local normpath = require( "normpath" )

t( normpath( "a/c" ), "a/c" )
t( normpath( "a//c" ), "a/c" )
t( normpath( "a/c/." ), "a/c" )
t( normpath( "a/c/b/.." ), "a/c" )
t( normpath( "/../a/c" ), "/a/c" )
t( normpath( "/../a/b/../././/c" ), "/a/c" )

t( normpath( "C:/a/b_/../b/c_/d_/../.././c" ), "C:/a/b/c" )

t()
