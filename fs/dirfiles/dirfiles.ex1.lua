local t = require( "taptest" )
local collectk = require( "collectk" )
local dirfiles = require( "dirfiles" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "tmp_dirfiles" ] = {
      [ "a" ] = {},
      [ "x" ] = "",
      [ "b" ] = {},
      [ "y" ] = "",
      [ "c" ] = {},
      [ "z" ] = ""
   }
}, true )

-- test
files = collectk( dirfiles( "tmp_dirfiles" ) )
table.sort( files )
t( #files, 3 )
t( files[ 1 ], "x" )
t( files[ 2 ], "y" )
t( files[ 3 ], "z" )

-- teardown
t( rmdirtree( "tmp_dirfiles" ), true )

t()
