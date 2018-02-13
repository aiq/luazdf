local t = require( "tapered" )
local frombase32 = require( "frombase32" )

--https://github.com/stesla/base32
t.is( frombase32( "MNUHK3TLPEQGEYLDN5XCC===" ), "chunky bacon!" )

local res, err = frombase32( "MS$DF" )
t.nok( res )
t.is( err, "unexpected character at position 3: '$'" )

t.done()
