local t = require( "tapered" )
local joinpath = require( "joinpath" )

t.is( "abc/def/ghi", joinpath{ "abc", "def", "ghi" } )
t.is( "abc/def/ghi", joinpath{ "abc/", "def", "/ghi" } )
t.is( "abc/def/ghi", joinpath{ "abc", "/def/", "ghi" } )
t.is( "abc/def/ghi", joinpath{ "abc", "def/ghi" } )

t.is( "", joinpath{} )

t.is( "/a/b/c", joinpath{ "/a", "/b/c/" } )

t.is( "/", joinpath{ "/", "/", "/" } )

t.done()
