local t = require( "tapered" )
local unixpath = require( "unixpath" )

t.is( "C:/a/b/c", unixpath[[C:\a\b\c]] )

t.done()
