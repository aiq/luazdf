local t = require( "taptest" )
local count = require( "count" )
local iseven = require( "iseven" )

local res = count( { 1, 2, 3, 4, 5 }, function( v )
   if iseven( v ) then return "even" else return "odd" end
end )

t( res.even, 2 )
t( res.odd, 3 )

t()
