local t = require( "tapered" )
local shellsplit = require( "shellsplit" )

shargs = shellsplit( 'here are "two words"' )
t.same( shargs, { "here", "are", "two words" } )

shargs = shellsplit( 'here "two words" are' )
t.same( shargs, { "here", "two words", "are" } )

shargs = shellsplit( "here are 'two words'" )
t.same( shargs, { "here", "are", "two words" } )

shargs = shellsplit( "-dfs -ar='one two three'" )
t.same( shargs, { "-dfs", "-ar=one two three" } )

t.done()
