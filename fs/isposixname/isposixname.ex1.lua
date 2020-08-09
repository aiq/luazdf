local t = require( "taptest" )
local isposixname = require( "isposixname" )

res, i = isposixname( "x" )
t( res, true )
t( i, nil )

res, i = isposixname( "." )
t( res, true )
t( i, nil )

res, i = isposixname( ".." )
t( res, true )
t( i, nil )

res, i = isposixname( "" )
t( res, false )
t( i, 1 )

res, i = isposixname( " " )
t( res, false )
t( i, 1 )

res, i = isposixname( ":" )
t( res, false )
t( i, 1 )

res, i = isposixname( "-" )
t( res, true )
t( i, nil )

res, i = isposixname( "foo bar" )
t( res, false )
t( i, 4 )

res, i = isposixname( "foo.bar" )
t( res, true )
t( i, nil )

res, i = isposixname( "foo.barf" )
t( res, true )
t( i, nil )

res, i = isposixname( ".foo" )
t( res, true )
t( i, nil )

res, i = isposixname( "foo." )
t( res, true )
t( i, nil )

t()
