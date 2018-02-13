local t = require( "tapered" )
local accessor = require( "accessor" )

local obj = {
   name = { first_name = "Dave",
            last_name = "Yarwood" },
   age = 28,
   hobbies = { "music", "languages", "programming" }
}

local age = accessor( obj, false, "age" )
t.is( "age", age.key )
t.is( 28, age:get() )
age:set( 29 )
t.is( 29, obj.age )

local city = accessor( obj, true, "address", "city" )
t.is( nil, city:get() )
city:set( "Durham" )
t.is( "Durham", obj.address.city )

t.done()
