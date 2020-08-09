local t = require( "taptest" )
local endswithany = require( "endswithany" )

filename = "note.adoc"
t( endswithany( filename, { ".adoc", ".lua" } ), true )
t( endswithany( filename, { ".txt", ".lua" } ), false )

t()
