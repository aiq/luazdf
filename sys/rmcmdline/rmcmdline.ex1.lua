local t = require( "taptest" )
local rmcmdline = require( "rmcmdline" )

-- should work for unix
cmd = rmcmdline( { unix = true } )
t( cmd, "rm" )

cmd = rmcmdline( { unix = true }, { force = true } )
t( cmd, "rm -f" )

cmd = rmcmdline( { unix = true }, { recursive = true, force = true } )
t( cmd, "rm -r -f" )

-- should work for windows
cmd = rmcmdline( { windows = true } )
t( cmd, "del" )

cmd = rmcmdline( { windows = true }, { force = true } )
t( cmd, "del /q" )

cmd = rmcmdline( { windows = true }, { recursive = true, force = true } )
t( cmd, "rd /s /q" )

t()
