local t = require( "taptest" )
local countmatch = require( "countmatch" )

-- sub string
t( countmatch( "aaa", "a" ), 3 )
t( countmatch( "", "" ), 0 )
t( countmatch( "", "a" ), 0 )

-- use pattern
t( countmatch( "hello world from Lua", "%a+" ), 4 ) -- count words

t()
