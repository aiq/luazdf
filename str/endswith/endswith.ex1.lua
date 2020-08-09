local t = require( "taptest" )
local endswith = require( "endswith" )

filename = "note.adoc"
t( endswith( filename, ".adoc" ), true )
t( endswith( filename, ".txt" ), false )

t()
