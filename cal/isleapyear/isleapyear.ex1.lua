local t = require( "tapered" )
local isleapyear = require( "isleapyear" )

t.nok( isleapyear( 1900 ) )
t.nok( isleapyear( 2001 ) )
t.nok( isleapyear( 2002 ) )

t.ok( isleapyear( 2000 ) )
t.ok( isleapyear( 2004 ) )
t.ok( isleapyear( 2008 ) )

t.done()
