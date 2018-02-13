local t = require( "tapered" )
local rootprefix = require( "rootprefix" )

-- win paths
t.is( "", rootprefix[[a\b\c.txt]] )
t.is( "", rootprefix[[C:a\b\c.txt]] )
t.is( "C:\\", rootprefix[[C:\a\b\c.txt]] )
t.is( "C:/", rootprefix( "C:/a/b/c.txt" ) )
t.is( [[\\server\]], rootprefix[[\\server\a\b\c.txt]] )

-- unix paths
t.is( "", rootprefix( "a/b/c,txt" ) )
t.is( "", rootprefix( "~/a/b/c.txt" ) )
t.is( "/", rootprefix( "/a/b/c.txt" ) )

t.done()
