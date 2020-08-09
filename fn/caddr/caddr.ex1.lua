local t = require( "taptest" )
local caddr = require( "caddr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t( caddr(), nil )
t( caddr{ 1.0 }, nil )
t( caddr{ "a", "b" }, nil )
t( caddr{ "a", "b", "c" }, "c" )
t( caddr{ beatles() }, "George" )

t()
