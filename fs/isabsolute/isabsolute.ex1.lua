local t = require( "taptest" )
local isabsolute = require( "isabsolute" )

--nodejs test-path.js examples
t( isabsolute( "//server/file" ), true )
t( isabsolute[[\\server\file]], true )
t( isabsolute( "C:/Users/" ), true )
t( isabsolute[[C:\Users\]], true )
t( isabsolute( "/home/foo" ), true )
t( isabsolute( "/home/foo/..." ), true )

t( isabsolute( "C:cwd/another" ), false )
t( isabsolute[[C:cwd\another]], false )
t( isabsolute( "directory/directory" ), false )
t( isabsolute[[directory\directory]], false )
t( isabsolute( "bar/" ), false )
t( isabsolute( "./baz" ), false )

t()
