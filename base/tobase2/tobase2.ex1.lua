local t = require( "tapered" )
local tobase2 = require( "tobase2" )

-- convert data to a bitfields string
t.is( tobase2( "ACDC" ), "01000001010000110100010001000011" )

t.done()
