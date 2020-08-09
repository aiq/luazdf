local t = require( "taptest" )
local rmprefix = require( "rmprefix" )

t( rmprefix( "abc.def", "abc." ), "def" )
t( rmprefix( "abc.def", "def." ), "abc.def" )
t( rmprefix( "abc.abc.def", "abc." ), "abc.def" )

t()
