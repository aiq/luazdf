local t = require( "taptest" )
local trunc = require( "trunc" )

t( trunc( 1.2 ), 1 )
t( trunc( 1.7 ), 1 )

t( trunc( -2.2 ), -2 )
t( trunc( -2.7 ), -2 )

t()
