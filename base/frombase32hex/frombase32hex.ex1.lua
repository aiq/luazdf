local t = require( "taptest" )
local frombase32hex = require( "frombase32hex" )

-- https://github.com/koksosk/base32hex
t( frombase32hex( "91IMOR3F" ), "Hello" )

t()
