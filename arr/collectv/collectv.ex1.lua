local t = require( "taptest" )
local collectv = require( "collectv" )
local like = require( "like" )

src = { a="x", b="y", c="z" }
values = collectv( pairs( src ) )
t( like( values, { "x", "y", "z" } ), true )

t()
