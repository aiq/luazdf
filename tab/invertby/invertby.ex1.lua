local t = require( "tapered" )
local invertby = require( "invertby" )
-- util functions
local like = require( "like" )

-- https://lodash.com/docs#invertBy
local tab = { a=1, b=2, c=1 }
local itab = invertby( tab )
t.ok( like( itab[ 1 ], { "a", "c" } ) )
t.ok( like( itab[ 2 ], { "b" } ) )
 
itab = invertby( tab, function( v ) return 'g'..v end )
t.ok( like( itab.g1, { "a", "c" } ) )
t.ok( like( itab.g2, { "b" } ) )
 
t.done()
