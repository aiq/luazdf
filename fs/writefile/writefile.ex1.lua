local t = require( "tapered" )
local writefile = require( "writefile" )

res, err = writefile( "WriteFileXmpl.txt", "first\n", 2 )
t.ok( res )
t.is( nil, err )

f = io.open( "WriteFileXmpl.txt" )
t.is( "first", f:read( "*l" ) )
t.is( 2, f:read( "*n" ) )
f:close()

os.remove( "WriteFileXmpl.txt" )

t.done()
