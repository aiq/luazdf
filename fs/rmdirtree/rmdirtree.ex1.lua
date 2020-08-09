local t = require( "taptest" )
local mkdirtree =require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- test
t( mkdirtree{
   [ "tmp_rmdirtree" ] = {
      [ "fa.txt" ] = "",
      [ "da" ] = {
         [ "dab" ] = {},
         [ "fab.txt" ] = "content",
      }
   }
}, true )

res, err = rmdirtree( "tmp_rmdirtree" )
t( res, true )
t( err, nil )

t()
