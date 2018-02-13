local t = require( "tapered" )
local cutstr = require( "cutstr" )

left, right = cutstr( "abc", 2 )
t.is( "ab", left )
t.is( "c", right )

t.done()
