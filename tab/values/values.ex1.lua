local t = require( "taptest" )
local like = require( "like" )
local values = require( "values" )

res = values{ even=2, odd=3, name="pierrot" }
t( like( res, { 2, 3, "pierrot" } ), true )

t()
