local t = require( "tapered" )
local partial = require( "partial" )

local function sum( a, b )
   return a + b
end

fixsum = partial( sum, 100 )

t.is( 128, fixsum( 28 ) )

t.done()
