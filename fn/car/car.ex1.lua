local t = require( "tapered" )
local car = require( "car" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t.is( nil, car() )
t.is( 1.0, car{ 1.0 } )
t.is( "a", car{ "a", "b" } )
t.is( "a", car{ "a", "b", "c" } )
t.is( "John", car{ beatles() } )

t.done()
