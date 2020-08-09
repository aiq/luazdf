local t = require( "taptest" )
local clear = require( "clear" )
local isempty = require( "isempty" )

-- array table
tab = { "a", "b", "c", "d", "e", "f" }
slimtab = clear( tab )
t( isempty( tab ), true )
t( isempty( slimtab ), true )
t( tab, slimtab )

-- dict table
tab = { [ "first" ] = 1, [ "second" ] = 2, [ "third" ] = 3  }
slimtab = clear( tab )
t( isempty( tab ), true )
t( isempty( slimtab ), true )
t( tab, slimtab )

t()
