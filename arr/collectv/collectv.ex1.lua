local t = require( "tapered" )
local collectv = require( "collectv" )
local like = require( "like" )

src = { a="x", b="y", c="z" }
values = collectv( pairs( src ) )
t.ok( like( { "x", "y", "z" }, values ) )

t.done()
