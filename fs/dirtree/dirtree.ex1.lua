local t = require( "taptest" )
local countlen = require( "countlen" )
local dirtree = require( "dirtree" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )
local same = require( "same" )

-- setup
t( mkdirtree{
   tmp_dirtree = {
      dir1 = {
         file1 = "content1",
         file2 = "content2"
      },
      dir2 = {
         file3 = "content3"
      }
   }
}, true )

-- test
entries = {}
for dir, base in dirtree( "tmp_dirtree" ) do
   entries[ base ] = dir
end

t( countlen( entries ), 5 )
t( same( entries.dir1, "tmp_dirtree" ), true )
t( same( entries.file1, "tmp_dirtree/dir1" ), true )
t( same( entries.file2, "tmp_dirtree/dir1" ), true )
t( same( entries.dir2, "tmp_dirtree" ), true )
t( same( entries.file3, "tmp_dirtree/dir2" ), true )

-- teardown
t( rmdirtree( "tmp_dirtree" ), true )

t()
