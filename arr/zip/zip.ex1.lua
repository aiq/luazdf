local t = require( "taptest" )
local same = require( "same" )
local zip = require( "zip" )

-- should work like the zip function from underscore.js
local res = zip{
   { "moe", "larry", "curly" },
   { 30, 40, 50 },
   { true, false, false }
}

t( #res, 3 )

t( same( res[ 1 ], { "moe", 30, true } ), true )
t( same( res[ 2 ], { "larry", 40, false } ), true )
t( same( res[ 3 ], { "curly", 50, false } ), true )

t()
