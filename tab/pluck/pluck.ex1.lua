local t = require( "tapered" )
local pluck = require( "pluck" )

-- Array table test
arr = { { "moe", "larry", "curly" }, { 30, 40, 50 }, { true, false, false } }
res = pluck( arr, 1 )

t.is( 3, #res )
t.same( { "moe", 30, true }, res )

-- Dict table test
dict = { { name = "moe", age = 30 },
         { name = "larry", age = 40 },
         { name = "curly", age = 60 } }
res = pluck( dict, "name" )

t.is( 3, #res )
t.same( { "moe", "larry", "curly" }, res )

t.done()
