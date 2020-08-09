local t = require( "taptest" )
local unixpath = require( "unixpath" )

t( unixpath[[C:\a\b\c]], "C:/a/b/c" )

t()
