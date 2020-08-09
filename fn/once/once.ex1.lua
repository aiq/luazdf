local t = require( "taptest" )
local once = require( "once" )

local v = 3

local add = function( n )
   v = v + n
   return v
end

local f = once( add )
t( f( 5 ), 8 )
t( f( 10 ), 8 )

t()
