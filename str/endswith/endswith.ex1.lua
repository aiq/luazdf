local t = require( "tapered" )
local endswith = require( "endswith" )

filename = "note.adoc"
t.ok( endswith( filename, ".adoc" ) )
t.nok( endswith( filename, ".txt" ) )

t.done()
