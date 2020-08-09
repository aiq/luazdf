local t = require( "taptest" )
local toroman = require( "toroman" )

t( toroman( 3 ), "III" )
t( toroman( 7 ), "VII" )
t( toroman( 1999 ), "MCMXCIX" )

t( toroman( 499, 0 ), "CDXCIX" )
t( toroman( 499, 1 ), "LDVLIV" )
t( toroman( 499, 2 ), "XDIX" )
t( toroman( 499, 3 ), "VDIV" )
t( toroman( 499, 4 ), "ID" )
   
t( toroman( -1 ), "" )

-- should allow only 3999 as max value
t( toroman( 3999 ), "MMMCMXCIX" )
t( toroman( 4000 ), "" )

t()
