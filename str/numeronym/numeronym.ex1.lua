local t = require( "tapered" )
local numeronym = require( "numeronym" )

t.is( numeronym( "internationalization" ), "i18n" )
t.is( numeronym( "accessibility" ), "a11y" )
t.is( numeronym( "software development" ), "s17t" )
t.is( numeronym( "systems administration" ), "s19n" )

t.done()
