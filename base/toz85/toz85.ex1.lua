local t = require( "taptest" )
local toz85 = require( "toz85" )

--http://rfc.zeromq.org/spec:32
local data = string.char( 0x86, 0x4f, 0xd2, 0x6f, 0xb5, 0x59, 0xf7, 0x5b )
t( toz85( data ), "HelloWorld" )

--https://github.com/msealand/z85.node/blob/master/test/encode.test.js
t( toz85( "1234" ), "f!$Kw" )

--wrong length error
local res, err = toz85( "abcdefghi" )
t( res, nil )
t( err, "invalid length: 9 - must be a multiple of 4" )

t()
