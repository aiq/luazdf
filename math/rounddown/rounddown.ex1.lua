local t = require( "taptest" )
local rounddown = require( "rounddown" )

t( rounddown( 3.2, 0 ), 3 )
t( rounddown( 76.9, 0 ), 76 )
t( rounddown( 3.14159, 3 ), 3.141 )
t( rounddown( -3.14159, 1 ), -3.1 )
t( rounddown( 31415.92654, -2 ), 31400 )

t()
