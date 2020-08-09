local t = require( "taptest" )
local car = require( "car" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t( car(), nil )
t( car{ 1.0 }, 1.0 )
t( car{ "a", "b" }, "a" )
t( car{ "a", "b", "c" }, "a" )
t( car{ beatles() }, "John" )

t()
