local t = require( "tapered" )
local isposixname = require( "isposixname" )

res, i = isposixname( "x" )
t.ok( res )
t.is( nil, i )

res, i = isposixname( "." )
t.ok( res )
t.is( nil, i )

res, i = isposixname( ".." )
t.ok( res )
t.is( nil, i )

res, i = isposixname( "" )
t.nok( res )
t.is( 1, i )

res, i = isposixname( " " )
t.nok( res )
t.is( 1, i )

res, i = isposixname( ":" )
t.nok( res )
t.is( 1, i )

res, i = isposixname( "-" )
t.ok( res )
t.is( nil, i )

res, i = isposixname( "foo bar" )
t.nok( res )
t.is( 4, i )

res, i = isposixname( "foo.bar" )
t.ok( res )
t.is( nil, i )

res, i = isposixname( "foo.barf" )
t.ok( res )
t.is( nil, i )

res, i = isposixname( ".foo" )
t.ok( res )
t.is( nil, i )

res, i = isposixname( "foo." )
t.ok( res )
t.is( nil, i )

t.done()
