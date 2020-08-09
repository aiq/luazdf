local t = require( "taptest" )
local collectk = require( "collectk" )
local dirif = require( "dirif" )
local isdodd = require( "isdodd" )
local mkdirtree = require( "mkdirtree" )
local notf = require( "notf" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "tmp_dirif" ] = {
      [ "d" ] = {},
      [ "f" ] = ""
   }
}, true )

-- test
entries = collectk( dirif( "tmp_dirif", notf( isdodd ) ) )
table.sort( entries )
t( #entries, 2 )
t( entries[ 1 ], "d" )
t( entries[ 2 ], "f" )

-- teardown
t( rmdirtree( "tmp_dirif" ), true )

t()
