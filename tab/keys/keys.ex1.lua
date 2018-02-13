local t = require( "tapered" )
local keys = require( "keys" )
-- util functions
local like = require( "like" )

t.ok( like( { "even", "odd", "name" }, keys{ even=2, odd=3, name="pierrot" } ) )

t.done()
