local t = require( "tapered" )
local snakecase = require( "snakecase" )

t.is( "wiki_word_bumpy_caps", snakecase{ "Wiki", "Word", "BUMPY", "caPS" } )

t.done()
