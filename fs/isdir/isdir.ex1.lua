local t = require( "tapered" )
local isdir = require( "isdir" )
-- util functions
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
res, err = mkdirtree{
   [ "tmpdir" ] = {
      [ "tmpfile.txt" ] = ""
   }
}

-- test
t.ok( isdir( "tmpdir" ) )
t.nok( isdir( "tmpdir/tmpfile.txt" ) )

-- teardown
t.ok( rmdirtree( "tmpdir" ) )

t.done()
