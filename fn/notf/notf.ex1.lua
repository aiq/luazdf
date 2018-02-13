local t = require( "tapered" )
local notf = require( "notf" )

f = notf( function () return false end )
t.ok( f() )

f = notf( function () return true end )
t.nok( f() )

f = notf( function ( b ) return b end )
t.ok( f( false ) )
t.nok( f( true ) )

t.done()
