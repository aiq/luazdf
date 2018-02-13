local t = require( "tapered" )
local dirname = require( "dirname" )

path = "/foo/bar/baz/asdf/quux.html"
t.is( "/foo/bar/baz/asdf", dirname( path ) )

t.is( "/etc", dirname( "/etc/passwd" ) )
t.is( "/", dirname( "/etc/" ) )
t.is( "/", dirname( "/" ) )
t.is( ".", dirname( "." ) )

t.done()
