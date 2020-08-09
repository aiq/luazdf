local t = require( "taptest" )
local isfile = require( "isfile" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "tmpdir" ] = {
      [ "tmpfile.txt" ] = ""
   }
}, true )

-- test
t( isfile( "tmpdir" ), false )
t( isfile( "tmpdir/tmpfile.txt" ), true )

-- teardown
t( rmdirtree( "tmpdir" ), true )

t()
