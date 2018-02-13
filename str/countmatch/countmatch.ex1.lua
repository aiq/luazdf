local t = require( "tapered" )
local countmatch = require( "countmatch" )

-- sub string
t.is( 3, countmatch( "aaa", "a" ) )
t.is( 0, countmatch( "", "" ) )
t.is( 0, countmatch( "", "a" ) )

-- use pattern
t.is( 4, countmatch( "hello world from Lua", "%a+" ) ) -- count words

t.done()
