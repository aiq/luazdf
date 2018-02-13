local t = require( "tapered" )
local tableize = require( "tableize" )

t.same( { "root" }, tableize( "root" ) )
t.same( { "root" }, tableize{ "root" } )
t.same( { 1 }, tableize( 1 ) )

t.same( {}, tableize() )
t.same( {}, tableize( nil ) )

t.done()
