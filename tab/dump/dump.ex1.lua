local t = require( "tapered" )
local dump = require( "dump" )
-- util functions
local like = require( "like" )
local readlines = require( "readlines" )

tab = { name="james bond", lucky_numbers={ 1, 2, 6, 8 }, cool=true }
f = io.open( "DumpXmpl.txt", "w" )
dump( tab, { file=f } )
f:close()

expect = { "cool: true", "name: james bond", "lucky_numbers:",
           "   1: 1", "   2: 2", "   3: 6", "   4: 8" }
written, err = readlines( "DumpXmpl.txt" )
t.ok( like( expect, written ) )

os.remove( "DumpXmpl.txt" )

t.done()
