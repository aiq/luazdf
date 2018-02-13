local t = require( "tapered" )
local isfile = require( "isfile" )
-- util functions
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "tmpdir" ] = {
      [ "tmpfile.txt" ] = ""
   }
} )

-- test
t.nok( isfile( "tmpdir" ) )
t.ok( isfile( "tmpdir/tmpfile.txt" ) )

-- teardown
t.ok( rmdirtree( "tmpdir" ) )

t.done()
