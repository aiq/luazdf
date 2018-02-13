local t = require( "tapered" )
local values = require( "values" )
-- util functions
local like = require( "like" )

t.ok( like( { 2, 3, "pierrot" }, values{ even=2, odd=3, name="pierrot" } ) )

t.done()
