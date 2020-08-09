local t = require( "taptest" )
local isdict = require( "isdict" )

t( isdict{ name="rupert pupkin", color="red"  }, true )
t( isdict{ "a", "b", "c", "d" }, false )

t()
