local t = require( "tapered" )
local group = require( "group" )

local iseven = require( "iseven" )

local res = group( { 1, 2, 3, 4, 5 }, function( v )
   if iseven( v ) then return "even" else return "odd" end
end )
      
t.same( { even={ 2, 4 }, odd={ 1, 3, 5 } }, res )

t.done()
