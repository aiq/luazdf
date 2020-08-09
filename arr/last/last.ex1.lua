local t = require( "taptest" )
local last = require( "last" )

arr = { "w", "x", "y", "z" }
t( last( arr ), "z" )

t()
