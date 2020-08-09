local t = require( "taptest" )
local snakecase = require( "snakecase" )

t( snakecase{ "Wiki", "Word", "BUMPY", "caPS" }, "wiki_word_bumpy_caps" )

t()
