local t = require( "taptest" )
local same = require( "same" )
local splitpath = require( "splitpath" )

t( same( splitpath( "a/b/c" ), { "a", "b", "c" } ), true )
t( same( splitpath( "a/b/c/" ), { "a", "b", "c" } ), true )
t( same( splitpath( "/a/b/c" ), { "a", "b", "c" } ), true )
t( same( splitpath( "c:/a/b/c" ), { "c:", "a", "b", "c" } ), true )

t()
