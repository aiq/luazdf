local t = require( "taptest" )
local winpath = require( "winpath" )

t( winpath( "C:/a/b/c" ), [[C:\a\b\c]] )

t()
