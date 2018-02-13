local t = require( "tapered" )
local camelcase = require( "camelcase" )

-- with table as argument
t.is( "WikiWordBumpyCaps", camelcase{ "Wiki", "Word", "bumpy", "Caps" } )

t.done()
