local t = require( "taptest" )
local flatten = require( "flatten" )

local res = flatten{ "a", { "b" }, { "c", { { "d" } } } }

t( #res, 4 )

t( res[ 1 ], "a" )
t( res[ 2 ], "b" )
t( res[ 3 ], "c" )
t( res[ 4 ], "d" )

t()
