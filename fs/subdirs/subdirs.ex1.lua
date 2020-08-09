local t = require( "taptest" )
local collectk = require( "collectk" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )
local subdirs = require( "subdirs" )

-- setup
t( mkdirtree{ 
   [ "tmp_subdir" ] = {
      [ "a" ] = {},
      [ "x" ] = "",
      [ "b" ] = {},
      [ "y" ] = "",
      [ "c" ] = {},
      [ "z" ] = ""
   }
}, true )

-- test
dirs = collectk( subdirs( "tmp_subdir" ) )
table.sort( dirs )
t( #dirs, 3 )
t( dirs[ 1 ], "a" )
t( dirs[ 2 ], "b" )
t( dirs[ 3 ], "c" )

-- teardown
t( rmdirtree( "tmp_subdir" ), true )

t()
