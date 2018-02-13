local t = require( "tapered" )
local append = require( "append" )

t.same( { 2, 4, 8 }, append( { 2, 4 }, 8 ) )
t.same( { 2, 4, 8, 16 }, append( { 2 }, 4, 8, 16 ) )

t.done()
