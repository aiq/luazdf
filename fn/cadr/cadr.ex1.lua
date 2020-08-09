local t = require( "taptest" )
local cadr = require( "cadr" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t( cadr(), nil )
t( cadr{ 1.0 }, nil )
t( cadr{ "a", "b" }, "b" )
t( cadr{ "a", "b", "c" }, "b" )
t( cadr{ beatles() }, "Paul" )

t()
