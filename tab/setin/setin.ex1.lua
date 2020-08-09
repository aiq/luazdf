local t = require( "taptest" )
local setin = require( "setin" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

setin( obj, 29, "age" )
t( obj.age, 29 )

setin( obj, "Durham", "address", "city" )
t( obj.address.city, "Durham" )

t()
