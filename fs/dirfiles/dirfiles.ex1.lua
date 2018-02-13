local t = require( "tapered" )
local dirfiles = require( "dirfiles" )
-- util functions
local collectk = require( "collectk" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "tmp_dirfiles" ] = {
      [ "a" ] = {},
      [ "x" ] = "",
      [ "b" ] = {},
      [ "y" ] = "",
      [ "c" ] = {},
      [ "z" ] = ""
   }
} )

-- test
files = collectk( dirfiles( "tmp_dirfiles" ) )
table.sort( files )
t.is( #files, 3 )
t.is( "x", files[ 1 ] )
t.is( "y", files[ 2 ] )
t.is( "z", files[ 3 ] )

-- teardown
t.ok( rmdirtree( "tmp_dirfiles" ) )

t.done()
