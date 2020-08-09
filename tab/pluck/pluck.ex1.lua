local t = require( "taptest" )
local pluck = require( "pluck" )
local same = require( "same" )

-- Array table test
arr = { { "moe", "larry", "curly" }, { 30, 40, 50 }, { true, false, false } }
res = pluck( arr, 1 )

t( #res, 3 )
t( same( res, { "moe", 30, true } ), true )

-- Dict table test
dict = { { name = "moe", age = 30 },
         { name = "larry", age = 40 },
         { name = "curly", age = 60 } }
res = pluck( dict, "name" )

t( #res, 3 )
t( same( res, { "moe", "larry", "curly" } ), true )

t()
