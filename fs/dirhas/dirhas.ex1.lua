local t = require( "tapered" )
local dirhas = require( "dirhas" )
-- util functions
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "tmpdir" ] = {
      [ "abc.txt" ] = "",
      [ "xyz.txt" ] = ""
   }
} )

-- test
t.ok( dirhas( "tmpdir", "xyz.txt" ) )
t.nok( dirhas( "tmpdir", "xyz" ) )

t.nok( dirhas( "tmpdir", "xyz.txt", "directory" ) )
t.ok( dirhas( "tmpdir", "xyz.txt", "file" ) )

-- teardown
t.ok( rmdirtree( "tmpdir" ) )

t.done()
