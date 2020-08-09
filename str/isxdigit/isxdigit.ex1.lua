local t = require( "taptest" )
local isxdigit = require( "isxdigit" )

t( isxdigit( "0123456789abcdefABCDEF" ), true )

res, pos = isxdigit( "" )
t( res, false )
t( 0, pos, 0 )

res, pos = isxdigit( "abcdefghABCDEFGH" )
t( res, false )
t( pos, 7 )

res, pos = isxdigit( "ABCDEFGHabcdefgh" )
t( res, false )
t( pos, 7 )

t()
