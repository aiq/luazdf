local t = require( "tapered" )
local explode = require( "explode" )

str = "one|two|three|four"

t.same( { "one", "two", "three", "four" }, explode( str, "|" ) )
t.same( { "one", "two|three|four" }, explode( str, "|", 2 ) )
t.same( { "one", "two", "three" }, explode( str, "|", -1 ) )

t.same( { "a ", "b c" }, explode( "a  +b c", " +" ) )

t.same( { "a;b;c" }, explode( "a;b;c", "/" ) )

t.done()
