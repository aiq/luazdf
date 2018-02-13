local t = require( "tapered" )
local numseq = require( "numseq" )

t.same( { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, numseq( 10 ) )
t.same( { 1, 2, 3, 4, 5 }, numseq( 5, 1 ) )
t.same( { 1, 2, 4, 8, 16 }, numseq( 5, 1, function ( v ) return v * 2 end ) )

t.done()
