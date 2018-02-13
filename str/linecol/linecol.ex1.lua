local t = require( "tapered" )
local linecol = require( "linecol" )

-- should work with a single line
line, col = linecol( "abcdefgh", 4 )
t.is( 1, line )
t.is( 4, col )

line, col = linecol( "abcdefgh", 1 )
t.is( 1, line )
t.is( 1, col )

-- first and last value
line, col = linecol( "", 1 )
t.is( 1, line )
t.is( 1, col )

line, col = linecol( "abc", 3 )
t.is( 1, line )
t.is( 3, col )

-- should work with multi line strings
line, col = linecol( "\nabcd\n\nefgh\n\n", 9 )
t.is( 4, line )
t.is( 2, col )

line, col = linecol( "abc\ndef\nghi", -1 )
t.is( 3, line )
t.is( 3, col )

-- should trim out of word values
line, col = linecol( "abc\ndef\nghi", 0 )
t.is( 1, line )
t.is( 1, col )

line, col = linecol( "abc\ndef\nghi", 20 )
t.is( 3, line )
t.is( 3, col )

t.done()
