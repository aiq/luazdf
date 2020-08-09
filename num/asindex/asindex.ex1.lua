local t = require( "taptest" )
local asindex = require( "asindex" )

length = 10

t( asindex( 7, length ), 7 )

t( asindex( -1, length ), 10 )
t( asindex( -10, length ), 1 )

t( asindex( 11, length ), 11 )
t( asindex( 0, length ), 0 )
t( asindex( -11, length ), 0 )

t( asindex( 10, length, true ), 10 )
t( asindex( 0, length, true ), 1 )
t( asindex( -11, length, true ), 1 )

t()
