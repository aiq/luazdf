local t = require( "tapered" )
local splitpath = require( "splitpath" )

t.same( { "a", "b", "c" }, splitpath( "a/b/c" ) )
t.same( { "a", "b", "c" }, splitpath( "a/b/c/" ) )
t.same( { "a", "b", "c" }, splitpath( "/a/b/c" ) )
t.same( { "c:", "a", "b", "c" }, splitpath( "c:/a/b/c" ) )

t.done()
