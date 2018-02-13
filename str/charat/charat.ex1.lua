local t = require( "tapered" )
local charat = require( "charat" )

t.is( "a", charat( "abcdef", 1 ) )
t.is( "c", charat( "abcdef", 3 ) )
t.is( "e", charat( "abcdef", -2 ) )

t.is( "", charat( "abc", 99 ) )
t.is( "", charat( "abc", -99 ) )
t.is( "", charat( "", 99 ) )

-- ⌘ - u2318 - e2 8c 98 - 226 140 152
t.is( 0xe2, string.byte( charat( "⌘", 1 ) ) )
t.is( 0x8c, string.byte( charat( "⌘", 2 ) ) )
t.is( 0x98, string.byte( charat( "⌘", 3 ) ) )

t.done()
