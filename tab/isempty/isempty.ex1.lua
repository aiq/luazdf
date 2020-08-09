local t = require( "taptest" )
local isempty = require( "isempty" )

t( isempty{}, true )
t( isempty{ 1, 2, 3 }, false )

local tab = { single_value="1" }
t( isempty( tab ), false )
tab.single_value = nil
t( isempty( tab ), true )

t()
