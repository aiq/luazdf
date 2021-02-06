local t = require( "taptest")
local relativepath = require( "relativepath" )

t( relativepath( "data/dir/test/aaa", "data/dir/impl/bbb" ), "../../impl/bbb" )
t( relativepath( "/the/same/path", "/the/same/path/order/../../path" ), "." )

--https://github.com/nodejs/node/blob/master/test/parallel/test-path.js
t( relativepath( "/var/lib", "/var" ), ".." )
t( relativepath( "/var/lib", "/bin" ), "../../bin" )
t( relativepath( "/var/lib", "/var/lib" ), "." )
t( relativepath( "/var/lib", "/var/apache" ), "../apache" )
t( relativepath( "/var/", "/var/lib" ), "lib" )
t( relativepath( "/", "/var/lib" ), "var/lib" )
t( relativepath( "/foo/test", "/foo/test/bar/package.json" ), "bar/package.json" )
t( relativepath( "/Users/a/web/b/test/mails", "/Users/a/web/b" ), "../.." )
t( relativepath( "/foo/bar/baz-quux", "/foo/bar/baz" ), "../baz" )
t( relativepath( "/foo/bar/baz", "/foo/bar/baz-quux" ), "../baz-quux" )
t( relativepath( "/baz-quux", "/baz" ), "../baz" )
t( relativepath( "/baz", "/baz-quux" ), "../baz-quux" )

t()
