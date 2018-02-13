local t = require( "tapered" )
local rmcmdline = require( "rmcmdline" )

-- should work for unix
t.is( "rm", rmcmdline( { unix = true } ) )
t.is( "rm -f", rmcmdline( { unix = true }, { force = true } ) )
t.is( "rm -r -f", rmcmdline( { unix = true }, { recursive = true, force = true } ) )

-- should work for windows
t.is( "del", rmcmdline( { windows = true } ) )
t.is( "del /q", rmcmdline( { windows = true }, { force = true } ) )
t.is( "rd /s /q", rmcmdline( { windows = true }, { recursive = true, force = true } ) )

t.done()
