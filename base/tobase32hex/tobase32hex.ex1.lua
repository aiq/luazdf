local t = require( "tapered" )
local tobase32hex = require( "tobase32hex" )

-- https://github.com/koksosk/base32hex
t.is( tobase32hex( "Hello" ), "91IMOR3F" )

t.done()
