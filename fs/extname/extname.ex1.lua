local t = require( "taptest" )
local extname = require( "extname" )

t( extname( "index.html" ), ".html" )
t( extname( "index.coffee.md" ), ".md" )

t( extname( "index.." ), "." )
t( extname( "index" ), "" )

t( extname( ".index" ), ".index" )
t( extname( "/.index" ), ".index" )

t( extname( "abc.def/index" ), "" )

t()
