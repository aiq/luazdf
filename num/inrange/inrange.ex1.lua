local t = require( "taptest" )
local inrange = require( "inrange" )

local min = 2
local max = 11

t( inrange( 2, min, max ), true )
t( inrange( 7, min, max ), true )
t( inrange( 11, min, max ), true )

t( inrange( 1, min, max ), false )
t( inrange( 12, min, max ), false )

t()
