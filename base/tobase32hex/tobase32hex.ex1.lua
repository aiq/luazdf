local t = require( "taptest" )
local tobase32hex = require( "tobase32hex" )

-- https://github.com/koksosk/base32hex
t( tobase32hex( "Hello" ), "91IMOR3F" )

t()
