local t = require( "taptest" )
local mkdirtree = require( "mkdirtree" )
local readfile = require( "readfile" )
local rmdirtree = require( "rmdirtree" )

-- test
res, err = mkdirtree{
   [ "root" ] = {
      [ "fa.txt" ] = "",
      [ "da" ]  = {
         [ "dab" ] = {},
         [ "fab.txt" ] = "content"
      }
   },
   [ "doot" ] = {
      [ "last.txt" ] = "the is the end"
   }
}

t( res, true )
t( err, nil )

t( readfile( "root/fa.txt" ), "" )
t( readfile( "root/da/fab.txt" ), "content" )
t( readfile( "doot/last.txt" ), "the is the end" )

t( rmdirtree( "root" ), true )
t( rmdirtree( "doot" ), true )

lfs.mkdir( "xxx" )

tree = {
  [ "zzz" ] = {
    [ "foo.txt" ] = "foo",
    [ "bar.txt" ] = "bar"
  }
}

res, err = mkdirtree( tree, "xxx" )

t( res, true )
t( err, nil )

t( readfile( "xxx/zzz/foo.txt" ), "foo" )
t( readfile( "xxx/zzz/bar.txt" ), "bar" )

-- teardown
t( rmdirtree( "xxx" ), true )

t()
