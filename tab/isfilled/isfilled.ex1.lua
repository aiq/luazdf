local t = require( "taptest" )
local isfilled = require( "isfilled" )

t( isfilled{}, false )
t( isfilled{ 1, 2, 3 }, true )

tab = { single_value="1" }
t( isfilled( tab ), true )
tab.single_value = nil
t( isfilled( tab ), false )

t()
