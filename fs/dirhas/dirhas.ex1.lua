local t = require( "taptest" )
local dirhas = require( "dirhas" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "tmpdir" ] = {
      [ "abc.txt" ] = "",
      [ "xyz.txt" ] = ""
   }
}, true )

-- test
t( dirhas( "tmpdir", "xyz.txt" ), "tmpdir/xyz.txt" )
t( dirhas( "tmpdir", "xyz" ), nil )

t( dirhas( "tmpdir", "xyz.txt", "directory" ), nil )
t( dirhas( "tmpdir", "xyz.txt", "file" ), "tmpdir/xyz.txt" )

-- teardown
t( rmdirtree( "tmpdir" ), true )

t()
