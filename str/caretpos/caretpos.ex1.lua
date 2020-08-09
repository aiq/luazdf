local t = require( "taptest" )
local caretpos = require( "caretpos" )

idx = caretpos( "abdefgh", 1, 4 )
t( idx, 4 )

idx = caretpos( "\nabcd\n\nefgh\n\n", 4, 2 )
t( idx, 9 )

idx = caretpos( "", 3, 2 )
t( idx, 1 )

t()
