local t = require( "tapered" )
local fnil = require( "fnil" )

local function favs( age, food ) 
   return string.format( "I'm %d years old and eat %s.", age, food )
end

local favs_with_defaults = fnil( favs, 28, "waffles" )

t.is( "I'm 64 years old and eat cranberries.",
      favs_with_defaults( 64, "cranberries" ) )

t.is( "I'm 28 years old and eat anchovy pizza.",
      favs_with_defaults( nil, "anchovy pizza" ) )

t.is( "I'm 16 years old and eat waffles.",
      favs_with_defaults( 16 ) )

t.is( "I'm 28 years old and eat waffles.",
      favs_with_defaults() )

t.done()
