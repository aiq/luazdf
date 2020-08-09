local t = require( "taptest" )
local group = require( "group" )
local iseven = require( "iseven" )
local same = require( "same" )

local res = group( { 1, 2, 3, 4, 5 }, function( v )
   if iseven( v ) then return "even" else return "odd" end
end )

t( same( res.even, { 2, 4 } ), true )
t( same( res.odd, { 1, 3, 5 } ), true )

t()
