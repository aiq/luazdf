local t = require( "tapered" )
local tobase16 = require( "tobase16" )

-- should convert data to a hex string
t.is( tobase16( "Hello world!" ), "48656C6C6F20776F726C6421" )

t.done()
