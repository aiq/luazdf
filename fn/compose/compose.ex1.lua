local t = require( "tapered" )
local compose = require( "compose" )

local function first( a, b )
   t.is( 1, a )
   t.is( 1, b )

   return ( a + b ), 1
end

local function second( a, b )
   t.is( 2, a )
   t.is( 1, b )

   return ( a + b ), 2
end

local function third( a, b )
   t.is( 3, a )
   t.is( 2, b )

   return ( a + b ), 3
end

local f = compose( first, second, third )
local a, b = f( 1, 1 )
t.is( 5, a )
t.is( 3, b )

t.done()
