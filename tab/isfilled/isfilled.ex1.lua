local t = require( "tapered" )
local isfilled = require( "isfilled" )

t.nok( isfilled{} )
t.ok( isfilled{ 1, 2, 3 } )

tab = { single_value="1" }
t.ok( isfilled( tab ) )
tab.single_value = nil
t.nok( isfilled( tab ) )

t.done()
