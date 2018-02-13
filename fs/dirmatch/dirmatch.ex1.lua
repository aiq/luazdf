local t = require( "tapered" )
local dirmatch = require( "dirmatch" )
-- util functions
local collectk = require( "collectk" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "tmp_dirmatch" ] = {
      [ "adir" ] = {},
      [ "afile" ] = "",
      [ "bdir" ] = {},
      [ "bfile" ] = ""
   }
} )

-- test
res = collectk( dirmatch( "tmp_dirmatch", "^a" ) )
table.sort( res )
t.is( #res, 2 )
t.is( "adir", res[ 1 ] )
t.is( "afile", res[ 2 ] )

res = collectk( dirmatch( "tmp_dirmatch", "file$" ) )
table.sort( res )
t.is( #res, 2 )
t.is( "afile", res[ 1 ] )
t.is( "bfile", res[ 2 ] )

-- teardown
t.ok( rmdirtree( "tmp_dirmatch" ) )

t.done()
