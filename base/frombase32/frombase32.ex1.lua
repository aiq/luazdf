local t = require( "taptest" )
local frombase32 = require( "frombase32" )

--https://github.com/stesla/base32
t( frombase32( "MNUHK3TLPEQGEYLDN5XCC===" ), "chunky bacon!" )

local res, err = frombase32( "MS$DF" )
t( res, nil )
t( err, "unexpected character at position 3: '$'" )

t()
