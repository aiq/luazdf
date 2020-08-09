local t = require( "taptest" )
local lastchar = require( "lastchar" )

t( lastchar( "abc" ), "c" )
t( lastchar( "" ), "" )

t()
