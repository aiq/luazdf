local t = require( "taptest" )
local partial = require( "partial" )

local function sum( a, b )
   return a + b
end

fixsum = partial( sum, 100 )

t( fixsum( 28 ), 128 )

t()
