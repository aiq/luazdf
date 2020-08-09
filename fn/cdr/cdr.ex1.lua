local t = require( "taptest" )
local cdr = require( "cdr" )
local same = require( "same" )

local function beatles()
   return "John", "Paul", "George", "Ringo"
end

t( cdr(), nil )
t( cdr{ 1.0 }, nil )
t( same( { "b" }, cdr{ "a", "b" }, { "b" } ), true )
t( same( cdr{ "a", "b", "c" }, { "b", "c" } ), true )
t( same( cdr{ beatles() }, { "Paul", "George", "Ringo" } ), true )

t()
