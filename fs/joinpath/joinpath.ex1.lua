local t = require( "taptest" )
local joinpath = require( "joinpath" )

t( joinpath{ "abc", "def", "ghi" }, "abc/def/ghi" )
t( joinpath{ "abc/", "def", "/ghi" }, "abc/def/ghi" )
t( joinpath{ "abc", "/def/", "ghi" }, "abc/def/ghi" )
t( joinpath{ "abc", "def/ghi" }, "abc/def/ghi" )

t( joinpath{}, "" )

t( joinpath{ "/a", "/b/c/" }, "/a/b/c" )

t( joinpath{ "/", "/", "/" }, "/" )

t()
