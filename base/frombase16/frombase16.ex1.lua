local t = require( "taptest" )
local frombase16 = require( "frombase16" )

-- read data from a upper and lower hex string
t( frombase16( "48656C6C6F20776F726C6421" ), "Hello world!" )
t( frombase16( "48656c6c6f20776f726c6421" ), "Hello world!" )

-- allows to ignore characters in a hex string", function()
t( frombase16( "4865-6c6c 6f20-776f 726c-6421", " -" ), "Hello world!" )

-- handles wrong characters without a crash
local res, err = frombase16( "4865-6c6c" )
t( res, nil )
t( err, "unexpected character at position 5: '-'" )

t()
