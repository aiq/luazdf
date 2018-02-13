local t = require( "tapered" )
local winpath = require( "winpath" )

t.is( [[C:\a\b\c]], winpath( "C:/a/b/c" ) )

t.done()
