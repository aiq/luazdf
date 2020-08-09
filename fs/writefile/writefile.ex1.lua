local t = require( "taptest" )
local writefile = require( "writefile" )

res, err = writefile( "WriteFileXmpl.txt", "first\n", 2 )
t( res, true )
t( err, nil )

f = io.open( "WriteFileXmpl.txt" )
t( f:read( "*l" ), "first" )
t( f:read( "*n" ), 2 )
f:close()

os.remove( "WriteFileXmpl.txt" )

t()
