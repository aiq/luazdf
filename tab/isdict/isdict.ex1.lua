local t = require( "tapered" )
local isdict = require( "isdict" )

t.ok( isdict{ name="rupert pupkin", color="red"  } )
t.nok( isdict{ "a", "b", "c", "d" } )

t.done()
