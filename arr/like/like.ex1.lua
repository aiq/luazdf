local t = require( "tapered" )
local like = require( "like" )

t.ok( like( { "a", "b", "c" }, { "b", "c", "a" } ) )
t.ok( like( { "a", "c", "c" }, { "c", "c", "a" } ) )
t.nok( like( { "a", "b", "c" }, { "a", "b", "d" } ) )

t.done()
