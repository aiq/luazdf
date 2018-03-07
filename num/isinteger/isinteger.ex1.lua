local t = require "taptest"
local isinteger = require "isinteger"

t( isinteger( 1 ),      true )
t( isinteger( 0 ),      true )
t( isinteger( 1.1 ),   false )
t( isinteger( "1" ),   false )
t( isinteger( true ),  false )
t( isinteger( { 1 } ), false )
t( isinteger(),        false )

t()
