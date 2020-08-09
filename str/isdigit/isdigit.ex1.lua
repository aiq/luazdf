local t = require( "taptest" )
local isdigit = require( "isdigit" )

t( isdigit( "0123456789" ), true )

res, pos = isdigit( "" )
t( res, false )
t( pos, 0 )

res, pos = isdigit( "01234v6789" )
t( res, false )
t( pos, 6 )

t()
