local t = require( "taptest" )
local shallowcopy = require( "shallowcopy" )
local same = require( "same" )

tab = { "abc", "def", { 123, 456 } }
copy = shallowcopy( tab )
t( tab ~= copy, true )
t( tab[ 3 ], copy[ 3 ] )
t( same( tab, copy ), true )

t()
