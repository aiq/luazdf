local t = require( "taptest" )
local filelist = require( "filelist" )

list = filelist{
   "aaa",
   [ "abc" ] = {
      "file1.txt",
      "file2.txt",
      [ "max" ] = {
         "min"
      },
      [ "x/yz" ] = { -- it is allowd to merge paths in directory names
         "beg.itr",
         "end.itr"
      },
      "zztop"
   },
   [ "empty" ] = { -- empty directory will be ignored
   },
   [ "foo" ] = {
      "bar",
      "" -- empty strings will will be ignored
   },
   "zztop"
}
table.sort( list )
t( #list, 9 )
t( list[ 1 ], "aaa" )
t( list[ 2 ], "abc/file1.txt" )
t( list[ 3 ], "abc/file2.txt" )
t( list[ 4 ], "abc/max/min" )
t( list[ 5 ], "abc/x/yz/beg.itr" )
t( list[ 6 ], "abc/x/yz/end.itr" )
t( list[ 7 ], "abc/zztop" )
t( list[ 8 ], "foo/bar" )
t( list[ 9 ], "zztop" )

tree = {
   [ "a" ] = { "1", "2", "3" },
   [ "xx" ] = { "a", "b" }
}
list = filelist( tree, "Z" ) -- use "Z" as root
table.sort( list )
t( #list, 5 )
t( list[ 1 ], "Z/a/1" )
t( list[ 2 ], "Z/a/2" )
t( list[ 3 ], "Z/a/3" )
t( list[ 4 ], "Z/xx/a" )
t( list[ 5 ], "Z/xx/b" )

t()
