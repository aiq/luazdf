local t = require( "tapered" )
local getin = require( "getin" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

t.is( "Yarwood", getin( obj, "name", "last_name" ) )
t.is( "programming", getin( obj, "hobbies", 3 ) )
t.is( nil, getin( obj, "birthday" ) )

t.done()
