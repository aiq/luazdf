local t = require( "taptest" )
local explode = require( "explode" )
local same = require( "same" )

str = "one|two|three|four"

res = explode( str, "|" )
t( same( res, { "one", "two", "three", "four" } ), true )


res = explode( str, "|", 2 )
t( same( res, { "one", "two|three|four" } ), true )

res = explode( str, "|", -1 )
t( same( res, { "one", "two", "three" } ), true )

res = explode( "a  +b c", " +" )
t( same( res, { "a ", "b c" } ), true )

res = explode( "a;b;c", "/" )
t( same( { "a;b;c" }, explode( "a;b;c", "/" ) ), true )

t()
