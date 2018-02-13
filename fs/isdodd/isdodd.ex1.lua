local t = require( "tapered" )
local isdodd = require( "isdodd" )

t.nok( isdodd( "file.txt" ) )
t.nok( isdodd( ".hidden.txt" ) )
t.ok( isdodd( "." ) )
t.ok( isdodd( ".." ) )

t.done()
