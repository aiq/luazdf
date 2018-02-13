local t = require( "tapered" )
local tobase32 = require( "tobase32" )

--https://github.com/stesla/base32
t.is( tobase32( "chunky bacon!" ), "MNUHK3TLPEQGEYLDN5XCC===" )

t.done()
