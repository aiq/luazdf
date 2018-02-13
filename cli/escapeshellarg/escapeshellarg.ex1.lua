local t = require( "tapered" )
local escapeshellarg = require( "escapeshellarg" )

t.is( [["Hello's world"]], escapeshellarg( "Hello's world" ) )
t.is( [["use a \" to mark"]], escapeshellarg( [[use a " to mark]] ) )

t.done()
