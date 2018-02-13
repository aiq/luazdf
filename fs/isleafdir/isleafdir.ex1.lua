local t = require( "tapered" )
local isleafdir = require( "isleafdir" )
-- util functions
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   [ "middir" ] = {
      [ "leafdir" ] = {
         [ "tmpfile.txt" ] = ""
      }
   }
} )

-- test
t.ok( isleafdir( "middir/leafdir" ) )
t.nok( isleafdir( "middir" ) )

-- teardown
t.ok( rmdirtree( "middir" ) )

t.done()
