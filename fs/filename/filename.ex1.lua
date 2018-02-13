local t = require( "tapered" )
local filename = require( "filename" )

t.is( "index", filename( "index.html" ) )
t.is( "index.coffee", filename( "index.coffee.md" ) )

t.is( "index.", filename( "index.." ) )
t.is( "index", filename( "index" ) )

t.is( "", filename( ".index" ) )
t.is( "", filename( "/.index" ) )

t.is( "index", filename( "abc.def/index" ) )

t.done()
