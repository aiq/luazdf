local t = require( "taptest" )
local shortfilename = require( "shortfilename" )

t( shortfilename( "index.html" ), "index" )
t( shortfilename( "index.coffee.md" ), "index" )

t( shortfilename( "index.." ), "index" )
t( shortfilename( "index" ), "index" )

t( shortfilename( ".index" ), "" )
t( shortfilename( "/.index" ), "" )

t( shortfilename( "abc.def/index" ), "index" )

t()
