local t = require( "taptest" )
local numeronym = require( "numeronym" )

t( numeronym( "internationalization" ), "i18n" )
t( numeronym( "accessibility" ), "a11y" )
t( numeronym( "software development" ), "s17t" )
t( numeronym( "systems administration" ), "s19n" )

t()
