local t = require( "taptest" )
local rmsuffix = require( "rmsuffix" )

t( rmsuffix( "node.txt", ".txt" ), "node" )
t( rmsuffix( "node.txt", ".adoc" ), "node.txt" )
t( rmsuffix( "node.txt.txt", ".txt" ), "node.txt" )

t()
