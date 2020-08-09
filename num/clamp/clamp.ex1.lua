local t = require( "taptest" )
local clamp = require( "clamp" )

min = 2
max = 11

t( clamp( 2, min, max ), 2 )
t( clamp( 7, min, max ), 7 )
t( clamp( 11, min, max ), 11 )

t( clamp( 1, min, max ), 2 )
t( clamp( 12, min, max ), 11 )

t()
