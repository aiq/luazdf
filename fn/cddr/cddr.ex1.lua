local t = require( "tapered" )
local cddr = require( "cddr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t.is( nil, cddr() )
t.is( nil, cddr{ 1.0 } )
t.is( nil, cddr{ "a", "b" } )
t.same( { "c" }, cddr{ "a", "b", "c" } )
t.same( { "George", "Ringo" }, cddr{ beatles() } )

t.done()
