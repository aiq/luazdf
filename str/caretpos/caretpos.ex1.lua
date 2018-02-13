local t = require( "tapered" )
local caretpos = require( "caretpos" )

idx = caretpos( "abdefgh", 1, 4 )
t.is( 4, idx )

idx = caretpos( "\nabcd\n\nefgh\n\n", 4, 2 )
t.is( 9, idx )

idx = caretpos( "", 3, 2 )
t.is( 1, idx )

t.done()
