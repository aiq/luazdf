local t = require( "taptest" )
local isleafdir = require( "isleafdir" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t( mkdirtree{
   [ "middir" ] = {
      [ "leafdir" ] = {
         [ "tmpfile.txt" ] = ""
      }
   }
}, true )

-- test
t( isleafdir( "middir/leafdir" ), true )
t( isleafdir( "middir" ), false )

-- teardown
t( rmdirtree( "middir" ), true )

t()
