local t = require( "taptest" )
local writelines = require( "writelines" )

res, err = writelines( "WriteLinesXmpl.txt", { "first line", "", "third line" } )
t( res, true )
t( err, nil )

f = io.open( "WriteLinesXmpl.txt" )
t( f:read( "*l" ), "first line" )
t( f:read( "*l" ), "" )
t( f:read( "*l" ), "third line" )
f:close()

os.remove( "WriteLinesXmpl.txt" )

t()
