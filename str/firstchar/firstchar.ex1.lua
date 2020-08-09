local t = require( "taptest" )
local firstchar = require( "firstchar" )

t( firstchar( "abc" ), "a" )
t( firstchar( "" ), "" )

t()
