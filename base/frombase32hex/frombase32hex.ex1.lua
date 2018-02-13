local t = require( "tapered" )
local frombase32hex = require( "frombase32hex" )

-- https://github.com/koksosk/base32hex
t.is( frombase32hex( "91IMOR3F" ), "Hello" )

t.done()
