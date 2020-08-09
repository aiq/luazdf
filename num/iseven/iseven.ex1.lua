local t = require( "taptest" )
local iseven = require( "iseven" )

t( iseven( 98 ), true )
t( iseven( 2 ), true )
t( iseven( 0 ), true )
t( iseven( -4 ), true )

t( iseven( 99 ), false )
t( iseven( 1 ), false )
t( iseven( -3 ), false )

t( iseven( 7.3 ), false )

t()
