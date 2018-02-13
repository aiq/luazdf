local t = require( "tapered" )
local caddr = require( "caddr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t.is( nil, caddr() )
t.is( nil, caddr{ 1.0 } )
t.is( nil, caddr{ "a", "b" } )
t.is( "c", caddr{ "a", "b", "c" } )
t.is( "George", caddr{ beatles() } )

t.done()
