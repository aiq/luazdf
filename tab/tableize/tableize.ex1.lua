local t = require( "taptest" )
local same = require( "same" )
local tableize = require( "tableize" )

t( same( tableize( "root" ), { "root" } ), true )
t( same( tableize{ "root" }, { "root" } ), true )
t( same( tableize( 1 ), { 1 } ), true )

t( same( tableize(), {} ), true )
t( same( tableize( nil ), {} ), true )

t()
