local t = require( "taptest" )
local dump = require( "dump" )
local like = require( "like" )
local readlines = require( "readlines" )

tab = { name="james bond", lucky_numbers={ 1, 2, 6, 8 }, cool=true }
f = io.open( "DumpXmpl.txt", "w" )
dump( tab, { file=f } )
f:close()

expect = { "cool: true", "name: james bond", "lucky_numbers:",
           "   1: 1", "   2: 2", "   3: 6", "   4: 8" }
written, err = readlines( "DumpXmpl.txt" )
t( like( written, expect ), true )

os.remove( "DumpXmpl.txt" )

t()
