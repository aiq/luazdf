local t = require( "tapered" )
local pathedges = require( "pathedges" )

t.same( pathedges{}, {} )
t.same( pathedges{ "a" }, {} )
t.same( pathedges{ "a", "b" }, { { "a", "b" } } )
t.same( pathedges{ "a", "b", "c" }, { { "a", "b" }, { "b", "c" } } )

t.done()
