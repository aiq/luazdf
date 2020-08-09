local t = require( "taptest" )
local fromz85 = require( "fromz85" )

--http://rfc.zeromq.org/spec:32
local data = string.char( 0x86, 0x4f, 0xd2, 0x6f, 0xb5, 0x59, 0xf7, 0x5b )
t( fromz85( "HelloWorld" ), data )

--https://github.com/msealand/z85.node/blob/master/test/encode.test.js
t( fromz85( "f!$Kw" ), "1234" )

--ignore characters
t( fromz85( "'f!$Kw'\n", "'\n" ), "1234" )

--wrong length error
local res, err = fromz85( "abcdefghi" )
t( res, nil )
t( err, "invalid length: 9 - must be a multiple of 5" )

--wrong character error
local c = string.char( 140 )
local res, err = fromz85( "f"..c.."$Kw" )
t( res, nil )
t( err, string.format( "unexpected character at position 2: '%s'", c ) )

t()
