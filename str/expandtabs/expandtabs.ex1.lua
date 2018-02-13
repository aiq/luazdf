local t = require( "tapered" )
local expandtabs = require( "expandtabs" )

nstr = expandtabs( "a\tab\tabc\tabcd" )
t.is( "a        ab        abc        abcd", nstr )

nstr = expandtabs( "a\tab\tabc\tabcd", 3 )
t.is( "a   ab   abc   abcd", nstr )

nstr = expandtabs( "a\tb\t\tb\ta", 2 )
t.is( "a  b    b  a", nstr )

nstr = expandtabs( "a\tb\t\tb\ta", 0 )
t.is( "abba", nstr )

t.done()
