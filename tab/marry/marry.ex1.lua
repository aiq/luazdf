local t = require( "tapered" )
local marry = require( "marry" )

local keys = { "even", "odd", "name" }
local values = { 2, 3, "pierrot" }

t.same( { even=2, odd=3, name="pierrot" }, marry( keys, values ) )

t.done()
