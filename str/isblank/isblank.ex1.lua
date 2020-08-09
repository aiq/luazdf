local t = require( "taptest" )
local isblank = require( "isblank" )

t( isblank( " \t " ), true )

res, pos = isblank( "" )
t( res, false )
t( pos, 0 )

re, pos = isblank( " \n" )
t( res, false )
t( pos, 2 )

t()
