local t = require( "taptest" )
local longextname = require( "longextname" )

t( longextname( "index.html" ), ".html" )
t( longextname( "index.coffee.md" ), ".coffee.md" )

t( longextname( "index.." ), ".." )
t( longextname( "index" ), "" )

t( longextname( ".index" ), ".index" )
t( longextname( "/.index" ), ".index" )

t( longextname( "abc.def/index" ), "" )

t()
