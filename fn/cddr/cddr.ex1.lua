local t = require( "taptest" )
local cddr = require( "cddr" )
local same = require( "same" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t( cddr(), nil )
t( cddr{ 1.0 }, nil )
t( cddr{ "a", "b" }, nil )
t( same( cddr{ "a", "b", "c" }, { "c" } ), true )
t( same( cddr{ beatles() }, { "George", "Ringo" } ), true )

t()
