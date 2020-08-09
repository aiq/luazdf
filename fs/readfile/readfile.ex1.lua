local t = require( "taptest" )
local readfile = require( "readfile" )

f = io.open( "ReadFileXmpl.txt", "w" )
f:write( "a ", "long ", "text\n", "is ", 1337 )
f:close()

str, err = readfile( "ReadFileXmpl.txt" )
t( str, "a long text\nis 1337" )
t( err, nil )

os.remove( "ReadFileXmpl.txt" )

t()
