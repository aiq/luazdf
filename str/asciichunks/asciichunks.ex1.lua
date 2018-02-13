local t = require( "tapered" )
local asciichunks = require( "asciichunks" )

chunks = asciichunks( "abc", 2 )
t.is( "ab", chunks[ 1 ] )
t.is( "c", chunks[ 2 ] )

chunks = asciichunks( "abc" )
t.is( "a", chunks[ 1 ] )
t.is( "b", chunks[ 2 ] )
t.is( "c", chunks[ 3 ] )

t.done()
