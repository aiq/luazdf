local t = require( "taptest" )
local camelcase = require( "camelcase" )

-- with table as argument
t( camelcase{ "Wiki", "Word", "bumpy", "Caps" }, "WikiWordBumpyCaps" )

t()
