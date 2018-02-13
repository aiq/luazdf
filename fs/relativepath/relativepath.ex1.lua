local t = require( "tapered" )
local relativepath = require( "relativepath" )

t.is( "../../impl/bbb", relativepath( "data/dir/test/aaa", "data/dir/impl/bbb" ) )

--https://github.com/nodejs/node/blob/master/test/parallel/test-path.js
t.is( "..", relativepath( "/var/lib", "/var" ) )
t.is( "../../bin", relativepath( "/var/lib", "/bin" ) )
t.is( "", relativepath( "/var/lib", "/var/lib" ) )
t.is( "../apache", relativepath( "/var/lib", "/var/apache" ) )
t.is( "lib", relativepath( "/var/", "/var/lib" ) )
t.is( "var/lib", relativepath( "/", "/var/lib" ) )
t.is( "bar/package.json", relativepath( "/foo/test", "/foo/test/bar/package.json" ) )
t.is( "../..", relativepath( "/Users/a/web/b/test/mails", "/Users/a/web/b" ) )
t.is( "../baz", relativepath( "/foo/bar/baz-quux", "/foo/bar/baz" ) )
t.is( "../baz-quux", relativepath( "/foo/bar/baz", "/foo/bar/baz-quux" ) )
t.is( "../baz", relativepath( "/baz-quux", "/baz" ) )
t.is( "../baz-quux", relativepath( "/baz", "/baz-quux" ) )

t.done()
