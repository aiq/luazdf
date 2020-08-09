local t = require( "taptest" )
local isalpha = require( "isalpha" )

t( isalpha( "abcABC" ), true )

res, pos = isalpha( "" )
t( res, false )
t( pos, 0 )

res, pos = isalpha( "abc123ABC" )
t( res, false )
t( pos, 4 )

res, pos = isalpha( "abcABC-123" )
t( res, false )
t( pos, 7 )

t()
