local t = require( "tapered" )
local cdr = require( "cdr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t.is( nil, cdr() )
t.is( nil, cdr{ 1.0 } )
t.same( { "b" }, cdr{ "a", "b" } )
t.same( { "b", "c" }, cdr{ "a", "b", "c" } )
t.same( { "Paul", "George", "Ringo" }, cdr{ beatles() } )

t.done()
