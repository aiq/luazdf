local t = require( "tapered" )
local deepcopy = require( "deepcopy" )

tab = { "abc", "def", { 123, 456 } }
copy = deepcopy( tab )
t.isnt( tab, copy )
t.isnt( tab[ 3 ], copy[ 3 ] )
t.same( tab, copy )

t.done()
