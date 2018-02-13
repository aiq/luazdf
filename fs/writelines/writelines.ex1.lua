local t = require( "tapered" )
local writelines = require( "writelines" )

res, err = writelines( "WriteLinesXmpl.txt", { "first line", "", "third line" } )
t.ok( res )
t.is( nil, err )

f = io.open( "WriteLinesXmpl.txt" )
t.is( "first line", f:read( "*l" ) )
t.is( "", f:read( "*l" ) )
t.is( "third line", f:read( "*l" ) )
f:close()

os.remove( "WriteLinesXmpl.txt" )

t.done()
