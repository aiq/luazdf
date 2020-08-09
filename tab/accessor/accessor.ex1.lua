local t = require( "taptest" )
local accessor = require( "accessor" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

local age = accessor( obj, false, "age" )
t( age.key, "age" )
t( age:get(), 28 )
age:set( 29 )
t( obj.age, 29 )

local city = accessor( obj, true, "address", "city" )
t( city:get(), nil )
city:set( "Durham" )
t( obj.address.city, "Durham" )

t()
