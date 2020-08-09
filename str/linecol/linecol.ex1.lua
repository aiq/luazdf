local t = require( "taptest" )
local linecol = require( "linecol" )

-- should work with a single line
line, col = linecol( "abcdefgh", 4 )
t( line, 1 )
t( col, 4 )

line, col = linecol( "abcdefgh", 1 )
t( line, 1 )
t( col, 1 )

-- first and last value
line, col = linecol( "", 1 )
t( line, 1 )
t( col, 1 )

line, col = linecol( "abc", 3 )
t( line, 1 )
t( col, 3 )

-- should work with multi line strings
line, col = linecol( "\nabcd\n\nefgh\n\n", 9 )
t( line, 4 )
t( col, 2 )

line, col = linecol( "abc\ndef\nghi", -1 )
t( line, 3 )
t( col, 3 )

-- should trim out of word values
line, col = linecol( "abc\ndef\nghi", 0 )
t( line, 1 )
t( col, 1 )

line, col = linecol( "abc\ndef\nghi", 20 )
t( line, 3 )
t( col, 3 )

t()
