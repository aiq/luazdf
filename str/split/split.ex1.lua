local t = require( "tapered" )
local split = require( "split" )

strlst = split( "a:b:c", ":" )
t.same( { "a", "b", "c" }, strlst )

strlst = split( ":a::c:", ":" )
t.same( { "", "a", "", "c", "" }, strlst )

strlst = split( "abc", "" )
t.same( { "a", "b", "c" }, strlst )

strlst = split( "a  +b c", " +" )
t.same( { "a", "+b", "c" }, strlst )

t.done()
