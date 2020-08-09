local t = require( "taptest" )
local collectk = require( "collectk" )
local dirmatch = require( "dirmatch" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "tmp_dirmatch" ] = {
      [ "adir" ] = {},
      [ "afile" ] = "",
      [ "bdir" ] = {},
      [ "bfile" ] = ""
   }
}, true )

-- test
res = collectk( dirmatch( "tmp_dirmatch", "^a" ) )
table.sort( res )
t( #res, 2 )
t( res[ 1 ], "adir" )
t( res[ 2 ], "afile" )

res = collectk( dirmatch( "tmp_dirmatch", "file$" ) )
table.sort( res )
t( #res, 2 )
t( res[ 1 ], "afile" )
t( res[ 2 ], "bfile" )

-- teardown
t( rmdirtree( "tmp_dirmatch" ), true )

t()
