local t = require( "taptest" )
local readlines = require( "readlines" )
local same = require( "same" )

f = io.open( "ReadLinesXmpl.txt", "w" )
f:write( "a ", "long ", "text\n\n", "is ", 1337 )
f:close()

strlst, err = readlines( "ReadLinesXmpl.txt" )
t( same( strlst, { "a long text", "", "is 1337" } ), true )

os.remove( "ReadLinesXmpl.txt" )

t()
