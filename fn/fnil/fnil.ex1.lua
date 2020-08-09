local t = require( "taptest" )
local fnil = require( "fnil" )

local function favs( age, food ) 
   return string.format( "I'm %d years old and eat %s.", age, food )
end

local favs_with_defaults = fnil( favs, 28, "waffles" )

t( favs_with_defaults( 64, "cranberries" ),
   "I'm 64 years old and eat cranberries." )

t( favs_with_defaults( nil, "anchovy pizza" ),
   "I'm 28 years old and eat anchovy pizza." )

t( favs_with_defaults( 16 ),
   "I'm 16 years old and eat waffles." )

t( favs_with_defaults(),
   "I'm 28 years old and eat waffles." )

t()
