local t = require( "tapered" )
local cadr = require( "cadr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t.is( nil, cadr() )
t.is( nil, cadr{ 1.0 } )
t.is( "b", cadr{ "a", "b" } )
t.is( "b", cadr{ "a", "b", "c" } )
t.is( "Paul", cadr{ beatles() } )

t.done()
