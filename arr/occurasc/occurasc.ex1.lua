local t = require( "taptest" )
local occurasc = require( "occurasc" )

local arr = { "a", "x", "r", "f", "i" }

t( occurasc( arr, "a", "x", "r", "f", "i" ), true )
t( occurasc( arr, "a", "i" ), true )
t( occurasc( arr, "a", "r", "i" ), true )
t( occurasc( arr, "i", "a" ), false )
t( occurasc( arr, "x", "z" ), false )

t()
