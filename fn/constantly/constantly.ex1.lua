local t = require( "tapered" )
local constantly = require( "constantly" )

f = constantly( "the usual suspect" )

t.is( "the usual suspect", f( 123 ) )
t.is( "the usual suspect", f( "sdfsadg" ) )

f = constantly( 42, true, "cow" )

t.same( { 42, true, "cow" }, { f( 123 ) } )
t.same( { 42, true, "cow" }, { f( 1, 2, 3 ) } )

t.done()
