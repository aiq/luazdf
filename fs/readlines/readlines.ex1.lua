local t = require( "tapered" )
local readlines = require( "readlines" )

f = io.open( "ReadLinesXmpl.txt", "w" )
f:write( "a ", "long ", "text\n\n", "is ", 1337 )
f:close()

strlst, err = readlines( "ReadLinesXmpl.txt" )
t.same( strlst, { "a long text", "", "is 1337" } )

os.remove( "ReadLinesXmpl.txt" )

t.done()
