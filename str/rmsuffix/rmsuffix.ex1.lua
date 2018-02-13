local t = require( "tapered" )
local rmsuffix = require( "rmsuffix" )

t.is( "node", rmsuffix( "node.txt", ".txt" ) )
t.is( "node.txt", rmsuffix( "node.txt", ".adoc" ) )
t.is( "node.txt", rmsuffix( "node.txt.txt", ".txt" ) )

t.done()
