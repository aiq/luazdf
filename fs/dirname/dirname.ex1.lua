local t = require( "taptest" )
local dirname = require( "dirname" )

path = "/foo/bar/baz/asdf/quux.html"
t( dirname( path ), "/foo/bar/baz/asdf" )

t( dirname( "/etc/passwd" ), "/etc" )
t( dirname( "/etc/" ), "/" )
t( dirname( "/" ), "/" )
t( dirname( "." ), "." )

t()
