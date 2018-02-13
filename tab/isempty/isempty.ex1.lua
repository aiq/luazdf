local t = require( "tapered" )
local isempty = require( "isempty" )

t.ok( isempty{} )
t.nok( isempty{ 1, 2, 3 } )

local tab = { single_value="1" }
t.nok( isempty( tab ) )
tab.single_value = nil
t.ok( isempty( tab ) )

t.done()
