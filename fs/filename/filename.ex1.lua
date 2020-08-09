local t = require( "taptest" )
local filename = require( "filename" )

t( filename( "index.html" ), "index" )
t( filename( "index.coffee.md" ), "index.coffee" )

t( filename( "index.." ), "index." )
t( filename( "index" ), "index" )

t( filename( ".index" ), "" )
t( filename( "/.index" ), "" )

t( filename( "abc.def/index" ), "index" )

t()
