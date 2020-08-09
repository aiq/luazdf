local t = require( "taptest" )
local tobase32 = require( "tobase32" )

--https://github.com/stesla/base32
t( tobase32( "chunky bacon!" ), "MNUHK3TLPEQGEYLDN5XCC===" )

t()
