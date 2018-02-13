local t = require( "tapered" )
local countlen = require( "countlen" )

tab = {}
t.is( 0, countlen( tab ) )

tab = { "a", "b", "c" }
t.is( 3, countlen( tab ) )

tab = {
   [ "a" ] = { 1, 2, 3 },
   [ "b" ] = "xyz",
   [ "c" ] = nil,
   [ "d" ] = { 1 }
}
t.is( 3, countlen( tab ) )

t.done()
