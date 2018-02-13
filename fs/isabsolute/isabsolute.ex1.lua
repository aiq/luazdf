local t = require( "tapered" )
local isabsolute = require( "isabsolute" )

--nodejs test-path.js examples
t.ok( isabsolute( "//server/file" ) )
t.ok( isabsolute[[\\server\file]] )
t.ok( isabsolute( "C:/Users/" ) )
t.ok( isabsolute[[C:\Users\]] )
t.ok( isabsolute( "/home/foo" ) )
t.ok( isabsolute( "/home/foo/..." ) )

t.nok( isabsolute( "C:cwd/another" ) )
t.nok( isabsolute[[C:cwd\another]] )
t.nok( isabsolute( "directory/directory" ) )
t.nok( isabsolute[[directory\directory]] )
t.nok( isabsolute( "bar/" ) )
t.nok( isabsolute( "./baz" ) )

t.done()
