local t = require( "tapered" )
local kebabcase = require( "kebabcase" )

t.is( "wiki-word-bumpy-caps", kebabcase{ "Wiki", "Word", "BUMPY", "caPS" } )

t.done()
