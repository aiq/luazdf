local t = require( "taptest" )
local asciichunks = require( "asciichunks" )

chunks = asciichunks( "abc", 2 )
t( chunks[ 1 ], "ab" )
t( chunks[ 2 ], "c" )

chunks = asciichunks( "abc" )
t( chunks[ 1 ], "a" )
t( chunks[ 2 ], "b" )
t( chunks[ 3 ], "c" )

t()
