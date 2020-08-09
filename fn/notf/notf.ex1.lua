local t = require( "taptest" )
local notf = require( "notf" )

f = notf( function () return false end )
t( f(), true )

f = notf( function () return true end )
t( f(), false )

f = notf( function ( b ) return b end )
t( f( false ), true )
t( f( true ), false )

t()
