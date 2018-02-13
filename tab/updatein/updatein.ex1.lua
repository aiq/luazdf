local t = require( "tapered" )
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
t.is( 27, users[ 1 ].age )

local function def( v )
   if not v then
      v = "a"
   end
   return v
end
updatein( users, def, 2, "notes", 1 )
t.is( "a", users[ 2 ].notes[ 1 ] )

t.done()
