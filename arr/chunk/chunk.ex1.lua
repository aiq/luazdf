local t = require( "tapered" )
local chunk = require( "chunk" )

local res = chunk( { "a", "b", "c", "d", "e", "f" }, 3 )
      
t.is( 2, #res )
t.same( { "a", "b", "c" }, res[ 1 ] )
t.same( { "d", "e", "f" }, res[ 2 ] )

t.done()
