local t = require( "taptest" )
local getin = require( "getin" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

t( getin( obj, "name", "last_name" ), "Yarwood" )
t( getin( obj, "hobbies", 3 ), "programming" )
t( getin( obj, "birthday" ), nil )

t()
