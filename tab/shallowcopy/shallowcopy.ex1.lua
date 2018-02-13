local t = require( "tapered" )
local shallowcopy = require( "shallowcopy" )

tab = { "abc", "def", { 123, 456 } }
copy = shallowcopy( tab )
t.isnt( tab, copy )
t.is( tab[ 3 ], copy[ 3 ] )
t.same( tab, copy )

t.done()
