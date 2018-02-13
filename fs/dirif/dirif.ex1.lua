local t = require( "tapered" )
local dirif = require( "dirif" )
-- util functions
local collectk = require( "collectk" )
local isdodd = require( "isdodd" )
local mkdirtree = require( "mkdirtree" )
local notf = require( "notf" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "tmp_dirif" ] = {
      [ "d" ] = {},
      [ "f" ] = ""
   }
} )

-- test
entries = collectk( dirif( "tmp_dirif", notf( isdodd ) ) )
table.sort( entries )
t.is( #entries, 2 )
t.is( "d", entries[ 1 ] )
t.is( "f", entries[ 2 ] )

-- teardown
t.ok( rmdirtree( "tmp_dirif" ) )

t.done()
