local t = require( "tapered" )
local readfile = require( "readfile" )

f = io.open( "ReadFileXmpl.txt", "w" )
f:write( "a ", "long ", "text\n", "is ", 1337 )
f:close()

str, err = readfile( "ReadFileXmpl.txt" )
t.is( "a long text\nis 1337", str )
t.is( nil, err )

os.remove( "ReadFileXmpl.txt" )

t.done()
