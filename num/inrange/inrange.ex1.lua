local t = require( "tapered" )
local inrange = require( "inrange" )

local min = 2
local max = 11

t.ok( inrange( 2, min, max ) )
t.ok( inrange( 7, min, max ) )
t.ok( inrange( 11, min, max ) )

t.nok( inrange( 1, min, max ) )
t.nok( inrange( 12, min, max ) )

t.done()
