local t = require( "tapered" )
local rmprefix = require( "rmprefix" )

t.is( "def", rmprefix( "abc.def", "abc." ) )
t.is( "abc.def", rmprefix( "abc.def", "def." ) )
t.is( "abc.def", rmprefix( "abc.abc.def", "abc." ) )

t.done()
