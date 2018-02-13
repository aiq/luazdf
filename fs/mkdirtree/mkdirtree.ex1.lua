local t = require( "tapered" )
local mkdirtree = require( "mkdirtree" )
-- util functions
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

t.ok( res )
t.is( nil, err )

t.is( "", readfile( "root/fa.txt" ) )
t.is( "content", readfile( "root/da/fab.txt" ) )
t.is( "the is the end", readfile( "doot/last.txt" ) )

t.ok( rmdirtree( "root" ) )
t.ok( rmdirtree( "doot" ) )

lfs.mkdir( "xxx" )

tree = {
  [ "zzz" ] = {
    [ "foo.txt" ] = "foo",
    [ "bar.txt" ] = "bar"
  }
}

res, err = mkdirtree( tree, "xxx" )

t.ok( res )
t.is( nil, err )

t.is( "foo", readfile( "xxx/zzz/foo.txt" ) )
t.is( "bar", readfile( "xxx/zzz/bar.txt" ) )

-- teardown
t.ok( rmdirtree( "xxx" ) )

t.done()
