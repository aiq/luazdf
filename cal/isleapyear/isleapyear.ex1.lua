local t = require( "taptest" )
local isleapyear = require( "isleapyear" )

t( isleapyear( 1900 ), false )
t( isleapyear( 2001 ), false )
t( isleapyear( 2002 ), false )

t( isleapyear( 2000 ), true )
t( isleapyear( 2004 ), true )
t( isleapyear( 2008 ), true )

t()
