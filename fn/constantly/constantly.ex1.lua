local t = require( "taptest" )
local constantly = require( "constantly" )
local same = require( "same" )

f = constantly( "the usual suspect" )

t( f( 123 ), "the usual suspect" )
t( f( "sdfsadg" ), "the usual suspect" )

f = constantly( 42, true, "cow" )

t( same( { f( 123 ) }, { 42, true, "cow" } ), true )
t( same( { f( 1, 2, 3 ) }, { 42, true, "cow" } ), true )

t()
