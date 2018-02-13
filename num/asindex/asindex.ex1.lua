local t = require( "tapered" )
local asindex = require( "asindex" )

length = 10

t.is( 7, asindex( 7, length ) )

t.is( 10, asindex( -1, length ) )
t.is( 1, asindex( -10, length ) )

t.is( 11, asindex( 11, length ) )
t.is( 0, asindex( 0, length ) )
t.is( 0, asindex( -11, length ) )

t.is( 10, asindex( 10, length, true ) )
t.is( 1, asindex( 0, length, true ) )
t.is( 1, asindex( -11, length, true ) )

t.done()
