local t = require( "taptest" )
local numseq = require( "numseq" )
local same = require( "same" )


seq = numseq( 10 )
t( same( seq, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 } ), true )

seq = numseq( 5, 1 )
t( same( seq, { 1, 2, 3, 4, 5 } ), true )

seq = numseq( 5, 1, function ( v ) return v * 2 end )
t( same( seq, { 1, 2, 4, 8, 16 } ), true )

t()
