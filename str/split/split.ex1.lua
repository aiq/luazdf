local t = require( "taptest" )
local same = require( "same" )
local split = require( "split" )

strlst = split( "a:b:c", ":" )
t( same( strlst, { "a", "b", "c" } ), true )

strlst = split( ":a::c:", ":" )
t( same( strlst, { "", "a", "", "c", "" } ), true )

strlst = split( "abc", "" )
t( same( strlst, { "a", "b", "c" } ), true )

strlst = split( "a  +b c", " +" )
t( same( strlst, { "a", "+b", "c" } ), true )

t()
