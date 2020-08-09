local t = require( "taptest" )
local divorce = require( "divorce" )
local like = require( "like" )

local keys, values = divorce{ even=2, odd=3, name="pierrot" }
      
t( like( { "even", "odd", "name" }, keys ), true )
t( like( { 2, 3, "pierrot" }, values ), true )

t()
