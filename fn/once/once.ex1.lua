local t = require( "tapered" )
local once = require( "once" )

local v = 3

local add = function( n )
   v = v + n
   return v
end

local f = once( add )
t.is( 8, f( 5 ) )
t.is( 8, f( 10 ) )

t.done()
