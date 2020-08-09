local t = require( "taptest" )
local compose = require( "compose" )

local function first( a, b )
   t( a, 1 )
   t( b, 1 )

   return ( a + b ), 1
end

local function second( a, b )
   t( a, 2 )
   t( b, 1 )

   return ( a + b ), 2
end

local function third( a, b )
   t( a, 3 )
   t( b, 2 )

   return ( a + b ), 3
end

local f = compose( first, second, third )
local a, b = f( 1, 1 )
t( a, 5 )
t( b, 3 )

t()
