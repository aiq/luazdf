local t = require( "tapered" )
local iswindowsname = require( "iswindowsname" )

res, i = iswindowsname( "x" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( "." )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( ".." )
t.nok( res )
t.is( 2, i )

res, i = iswindowsname( "" )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( " " )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( ":" )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( "-" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( "foo bar" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( " bar" )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( "foo " )
t.nok( res )
t.is( 4, i )

res, i = iswindowsname( "foo.bar" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( "foo.barf" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( ".foo" )
t.ok( res )
t.is( nil, i )

res, i = iswindowsname( "foo." )
t.nok( res )
t.is( 4, i )

res, i = iswindowsname( "CON" )
t.nok( res )
t.is( 1, i )

res, i = iswindowsname( "CONTI" )
t.ok( res )
t.is( nil, i )

t.done()
