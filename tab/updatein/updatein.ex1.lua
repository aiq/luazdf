local t = require( "taptest" )
local updatein = require( "updatein" )

local users = {
   {
      name = "James",
      age = 26
   },
   {
      name = "John",
      age = 43
   }
}

local function inc( i )
   return i+1
end
updatein( users, inc, 1, "age" )
t( users[ 1 ].age, 27 )

local function def( v )
   if not v then
      v = "a"
   end
   return v
end
updatein( users, def, 2, "notes", 1 )
t( users[ 2 ].notes[ 1 ], "a" )

t()
