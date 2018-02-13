local t = require( "tapered" )
local clear = require( "clear" )
-- util functions
local isempty = require( "isempty" )

-- array table
tab = { "a", "b", "c", "d", "e", "f" }
slimtab = clear( tab )
t.ok( isempty( tab ) )
t.ok( isempty( slimtab ) )
t.is( tab, slimtab )

-- dict table
tab = { [ "first" ] = 1, [ "second" ] = 2, [ "third" ] = 3  }
slimtab = clear( tab )
t.ok( isempty( tab ) )
t.ok( isempty( slimtab ) )
t.is( tab, slimtab )

t.done()
