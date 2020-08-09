local t = require( "taptest" )
local isdir = require( "isdir" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
res, err = mkdirtree{
   [ "tmpdir" ] = {
      [ "tmpfile.txt" ] = ""
   }
}

-- test
t( isdir( "tmpdir" ), true )
t( isdir( "tmpdir/tmpfile.txt" ), false )

-- teardown
t( rmdirtree( "tmpdir" ), true )

t()
