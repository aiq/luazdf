local t = require( "taptest" )
local marry = require( "marry" )
local same = require( "same" )

local keys = { "even", "odd", "name" }
local values = { 2, 3, "pierrot" }

t( same( marry( keys, values ), { even=2, odd=3, name="pierrot" } ), true )

t()
