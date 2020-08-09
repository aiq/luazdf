local t = require( "taptest" )
local kebabcase = require( "kebabcase" )

t( kebabcase{ "Wiki", "Word", "BUMPY", "caPS" }, "wiki-word-bumpy-caps" )

t()
