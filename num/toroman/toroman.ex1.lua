local t = require( "tapered" )
local toroman = require( "toroman" )

t.is( "III", toroman( 3 ) )
t.is( "VII", toroman( 7 ) )
t.is( "MCMXCIX", toroman( 1999 ) )

t.is( "CDXCIX", toroman( 499, 0 ) )
t.is( "LDVLIV", toroman( 499, 1 ) )
t.is( "XDIX", toroman( 499, 2 ) )
t.is( "VDIV", toroman( 499, 3 ) )
t.is( "ID", toroman( 499, 4 ) )
   
t.is( "", toroman( -1 ) )

-- should allow only 3999 as max value
t.is( "MMMCMXCIX", toroman( 3999 ) )
t.is( "", toroman( 4000 ) )

t.done()
