local t = require( "tapered" )
local divorce = require( "divorce" )
-- util functions
local like = require( "like" )

local keys, values = divorce{ even=2, odd=3, name="pierrot" }
      
t.ok( like( { "even", "odd", "name" }, keys ) )
t.ok( like( { 2, 3, "pierrot" }, values ) )

t.done()
