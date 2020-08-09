local t = require( "taptest" )
local charat = require( "charat" )

t( charat( "abcdef", 1 ), "a" )
t( charat( "abcdef", 3 ), "c" )
t( charat( "abcdef", -2 ), "e" )

t( charat( "abc", 99 ), "" )
t( charat( "abc", -99 ), "" )
t( charat( "", 99 ), "" )

-- ⌘ - u2318 - e2 8c 98 - 226 140 152
t( string.byte( charat( "⌘", 1 ) ), 0xe2 )
t( string.byte( charat( "⌘", 2 ) ), 0x8c )
t( string.byte( charat( "⌘", 3 ) ), 0x98 )

t()
