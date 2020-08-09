local t = require( "taptest" )
local collectk = require( "collectk" )
local same = require( "same" )
local utf8codes = require( "utf8codes" )

local codes = collectk( utf8codes( "ÆØÅ" ) )
t( same( { "Æ", "Ø", "Å" }, codes ), true )

t()
