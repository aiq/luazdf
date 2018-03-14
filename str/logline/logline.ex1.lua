local t = require "taptest"
local logline = require "logline"

-- The checker: when verifing strings use patern matchin
-- Otherwise fallback to ==
local function pcheck( got, exp )
   if type( exp ) ~= type( got ) then return false end
   if "string" ~= type( got ) then return ( got == exp ) end
   return ( nil ~= got:match( exp ) )
end

-- Default log level is 25 a.k.a. ERROR
-- Only logline with smaller level will generate a message

t( logline( 10, "test" ), "|", pcheck )
t( logline( 25, "test" ), "|", pcheck )
t( logline( 26, "test" ), nil, pcheck )
t( logline( 99, "test" ), nil, pcheck )

-- Change log level
logline( 60 )
t( logline( 10, "test" ), "|", pcheck )
t( logline( 60, "test" ), "|", pcheck )
t( logline( 61, "test" ), nil, pcheck )
t( logline( 99, "test" ), nil, pcheck )

-- Symbolic log level name

logline( "error" )
t( logline( 25, "test" ),        "|", pcheck )
t( logline( 26, "test" ),        nil, pcheck )
t( logline( "error", "test" ),   "|", pcheck )
t( logline( "debug", "test" ),   nil, pcheck )
t( logline( "info", "test" ),    nil, pcheck )
t( logline( "verbose", "test" ), nil, pcheck )

logline( "debug" )
t( logline( 50, "test" ),        "|", pcheck )
t( logline( 51, "test" ),        nil, pcheck )
t( logline( "error", "test" ),   "|", pcheck )
t( logline( "debug", "test" ),   "|", pcheck )
t( logline( "info", "test" ),    nil, pcheck )
t( logline( "verbose", "test" ), nil, pcheck )

logline( "info" )
t( logline( 75, "test" ),        "|", pcheck )
t( logline( 76, "test" ),        nil, pcheck )
t( logline( "error", "test" ),   "|", pcheck )
t( logline( "debug", "test" ),   "|", pcheck )
t( logline( "info", "test" ),    "|", pcheck )
t( logline( "verbose", "test" ), nil, pcheck )

logline( "verbose" )
t( logline( 99, "test" ),        "|", pcheck )
t( logline( 100, "test" ),       nil, pcheck )
t( logline( "error", "test" ),   "|", pcheck )
t( logline( "debug", "test" ),   "|", pcheck )
t( logline( "info", "test" ),    "|", pcheck )
t( logline( "verbose", "test" ), "|", pcheck )

-- Message contains source position
t( logline( 99, "test" ), "logline%.ex1%.lua:62", pcheck ) -- he line 62 is this one

-- In some case the caller source position is used:
-- - Tail calls
-- - Functions with names that start or end with "log"

function wraplog( ... ) return logline( 99, ... ) end
function wraplogfakebarrier( ... ) return logline( 99, ... ) end
function wraplogbarrier( ... )
   local res = logline( 99, ... ) -- line 72
   return res
end

t( wraplog( "test" ),            "logline%.ex1%.lua:75", pcheck ) -- line 75
t( wraplogfakebarrier( "test" ), "logline%.ex1%.lua:76", pcheck ) -- line 76
t( wraplogbarrier( "test" ),     "logline%.ex1%.lua:71", pcheck )

-- The argument are appended to the result string
t( logline( 99, "a", 1), "| a | 1 | $", pcheck )

-- OTHER STUFF IN THE LOG: --TODO : TEST ?
-- - date
-- - time
-- - os.clock() result
-- - incremental number
-- - log level of the line

print( "# "..logline( 80, "ok" ) )

t( )

