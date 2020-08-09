local t = require( "taptest" )
local same = require( "same" )
local without = require( "without" )

local res = without( { 1, 2, 1, 0, 3, 1, 4 }, 0, 1 )
t( same( res, { 2, 3, 4 } ), true )

t()
