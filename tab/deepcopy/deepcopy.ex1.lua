local t = require( "taptest" )
local deepcopy = require( "deepcopy" )
local same = require( "same" )

tab = { "abc", "def", { 123, 456 } }
copy = deepcopy( tab )
t( tab ~= copy, true )
t( tab[ 3 ] ~= copy[ 3 ], true )
t( same( tab, copy ), true )

t()
