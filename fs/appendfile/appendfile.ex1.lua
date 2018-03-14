local t = require "taptest"
local appendfile = require "appendfile"
local readfile = require "readfile"

t( appendfile( "appendfile.txt", "123" ), true )
t( readfile( "appendfile.txt" ), "123" )

t( appendfile( "appendfile.txt", "456" ), true )
t( readfile( "appendfile.txt" ), "123456" )

t( appendfile( "appendfile.txt", { "7","8" } ), true )
t( readfile( "appendfile.txt" ), "12345678" )

t( appendfile( "appendfile.txt", {"9","10"}, "<", ">" ), true )
t( readfile( "appendfile.txt" ), "12345678<9><10>" )

os.remove( "appendfile.txt" )

t()
