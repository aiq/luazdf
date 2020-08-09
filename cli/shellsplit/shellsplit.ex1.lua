local t = require( "taptest" )
local same = require( "same" )
local shellsplit = require( "shellsplit" )

shargs = shellsplit( 'here are "two words"' )
t( same( shargs, { "here", "are", "two words" } ), true )

shargs = shellsplit( 'here "two words" are' )
t( same( shargs, { "here", "two words", "are" } ), true )

shargs = shellsplit( "here are 'two words'" )
t( same( shargs, { "here", "are", "two words" } ), true )

shargs = shellsplit( "-dfs -ar='one two three'" )
t( same( shargs, { "-dfs", "-ar=one two three" } ), true )

t()
