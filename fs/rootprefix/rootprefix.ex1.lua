local t = require( "taptest" )
local rootprefix = require( "rootprefix" )

-- win paths
t( rootprefix[[a\b\c.txt]], "" )
t( rootprefix[[C:a\b\c.txt]], "" )
t( rootprefix[[C:\a\b\c.txt]], "C:\\" )
t( rootprefix( "C:/a/b/c.txt" ), "C:/" )
t( rootprefix[[\\server\a\b\c.txt]], [[\\server\]] )

-- unix paths
t( rootprefix( "a/b/c,txt" ), "" )
t( rootprefix( "~/a/b/c.txt" ), "" )
t( rootprefix( "/a/b/c.txt" ), "/" )

t()
