local t = require( "taptest" )
local expandtabs = require( "expandtabs" )

nstr = expandtabs( "a\tab\tabc\tabcd" )
t( nstr, "a        ab        abc        abcd" )

nstr = expandtabs( "a\tab\tabc\tabcd", 3 )
t( nstr, "a   ab   abc   abcd" )

nstr = expandtabs( "a\tb\t\tb\ta", 2 )
t( nstr, "a  b    b  a" )

nstr = expandtabs( "a\tb\t\tb\ta", 0 )
t( nstr, "abba" )

t()
