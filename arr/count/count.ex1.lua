local t = require( "tapered" )
local count = require( "count" )

local iseven = require( "iseven" )

local res = count( { 1, 2, 3, 4, 5 }, function( v )
   if iseven( v ) then return "even" else return "odd" end
end )
      
t.same( { even=2, odd=3 }, res )

t.done()
