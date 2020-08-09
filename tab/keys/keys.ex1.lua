local t = require( "taptest" )
local keys = require( "keys" )
local like = require( "like" )

res = keys{ even=2, odd=3, name="pierrot" }
t( like( res, { "even", "odd", "name" } ), true )

t()
