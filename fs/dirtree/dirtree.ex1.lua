local t = require( "tapered" )
local dirtree = require( "dirtree" )
-- util functions
local countlen = require( "countlen" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

-- setup
t.ok( mkdirtree{
   tmp_dirtree = {
      dir1 = {
         file1 = "content1",
         file2 = "content2"
      },
      dir2 = {
         file3 = "content3"
      }
   }
} )

-- test
entries = {}
for dir, base in dirtree( "tmp_dirtree" ) do
   entries[ base ] = dir
end

t.is( countlen( entries ), 5 )
t.same( entries.dir1, "tmp_dirtree" )
t.same( entries.file1, "tmp_dirtree/dir1" )
t.same( entries.file2, "tmp_dirtree/dir1" )
t.same( entries.dir2, "tmp_dirtree" )
t.same( entries.file3, "tmp_dirtree/dir2" )

-- teardown
t.ok( rmdirtree( "tmp_dirtree" ) )

t.done()
