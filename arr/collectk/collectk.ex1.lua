local t = require( "tapered" )
local collectk = require( "collectk" )

local like = require( "like" )

src = { a="x", b="y", c="z" }
keys = collectk( pairs( src ) )
t.ok( like( { "a", "b", "c" }, keys ) )

t.done()
