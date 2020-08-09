local t = require( "taptest" )
local collectk = require( "collectk" )
local like = require( "like" )

src = { a="x", b="y", c="z" }
keys = collectk( pairs( src ) )
t( like( keys, { "a", "b", "c" } ), true )

t()
