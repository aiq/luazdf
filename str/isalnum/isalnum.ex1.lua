local t = require( "taptest" )
local isalnum = require( "isalnum" )

t( isalnum( "abc123ABC" ), true )

res, pos = isalnum( "" )
t( res, false )
t( pos, 0 )

res, pos = isalnum( "abc 123 ABC" )
t( res, false )
t( pos, 4 )

res, pos = isalnum( "abc123-ABC" )
t( res, false )
t( pos, 7 )

t()
