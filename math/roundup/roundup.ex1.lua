local t = require( "taptest" )
local roundup = require( "roundup" )

t( roundup( 3.2, 0 ), 4 )
t( roundup( 76.9, 0 ), 77 )
t( roundup( 3.14159, 3 ), 3.142 )
t( roundup( -3.14159, 1 ), -3.2 )
t( roundup( 31415.92654, -2 ), 31500 )

t()
