local t = require( "tapered" )
local setin = require( "setin" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

setin( obj, 29, "age" )
t.is( 29, obj.age )

setin( obj, "Durham", "address", "city" )
t.is( "Durham", obj.address.city )

t.done()
