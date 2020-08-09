local t = require( "taptest" )
local countlen = require( "countlen" )

tab = {}
t( countlen( tab ), 0 )

tab = { "a", "b", "c" }
t( countlen( tab ), 3 )

tab = {
   [ "a" ] = { 1, 2, 3 },
   [ "b" ] = "xyz",
   [ "c" ] = nil,
   [ "d" ] = { 1 }
}
t( countlen( tab ), 3 )

t()
