local t = require( "taptest" )
local iswindowsname = require( "iswindowsname" )

res, i = iswindowsname( "x" )
t( res, true )
t( i, nil )

res, i = iswindowsname( "." )
t( res, false )
t( i, 1 )

res, i = iswindowsname( ".." )
t( res, false )
t( i, 2 )

res, i = iswindowsname( "" )
t( res, false )
t( 1, i, 1 )

res, i = iswindowsname( " " )
t( res, false )
t( i, 1 )

res, i = iswindowsname( ":" )
t( res, false )
t( i, 1 )

res, i = iswindowsname( "-" )
t( res, true )
t( i, nil )

res, i = iswindowsname( "foo bar" )
t( res, true )
t( i, nil )

res, i = iswindowsname( " bar" )
t( res, false )
t( i, 1 )

res, i = iswindowsname( "foo " )
t( res, false )
t( i, 4 )

res, i = iswindowsname( "foo.bar" )
t( res, true )
t( i, nil )

res, i = iswindowsname( "foo.barf" )
t( res, true )
t( i, nil )

res, i = iswindowsname( ".foo" )
t( res, true )
t( i, nil )

res, i = iswindowsname( "foo." )
t( res, false )
t( i, 4 )

res, i = iswindowsname( "CON" )
t( res, false )
t( i, 1 )

res, i = iswindowsname( "CONTI" )
t( res, true )
t( i, nil )

t()
