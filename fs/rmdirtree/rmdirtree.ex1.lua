local t = require( "tapered" )
local rmdirtree = require( "rmdirtree" )
-- util functions
local mkdirtree =require( "mkdirtree" )

-- test
t.ok( mkdirtree{
   [ "tmp_rmdirtree" ] = {
      [ "fa.txt" ] = "",
      [ "da" ] = {
         [ "dab" ] = {},
         [ "fab.txt" ] = "content",
      }
   }
} )

res, err = rmdirtree( "tmp_rmdirtree" )
t.ok( res )
t.is( nil, err )

t.done()
