local t = require( "tapered" )
local endswithany = require( "endswithany" )

filename = "note.adoc"
t.ok( endswithany( filename, { ".adoc", ".lua" } ) )
t.nok( endswithany( filename, { ".txt", ".lua" } ) )

t.done()
