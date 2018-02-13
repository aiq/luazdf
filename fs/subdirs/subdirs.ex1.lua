local t = require( "tapered" )
local subdirs = require( "subdirs" )
-- util functions
local collectk = require( "collectk" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{ 
   [ "tmp_subdir" ] = {
      [ "a" ] = {},
      [ "x" ] = "",
      [ "b" ] = {},
      [ "y" ] = "",
      [ "c" ] = {},
      [ "z" ] = ""
   }
} )

-- test
dirs = collectk( subdirs( "tmp_subdir" ) )
table.sort( dirs )
t.is( #dirs, 3 )
t.is( "a", dirs[ 1 ] )
t.is( "b", dirs[ 2 ] )
t.is( "c", dirs[ 3 ] )

-- teardown
t.ok( rmdirtree( "tmp_subdir" ) )

t.done()
