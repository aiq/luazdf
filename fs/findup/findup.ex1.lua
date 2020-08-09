local t = require( "taptest" )
local currentdir = require( "currentdir" )
local findup = require( "findup" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )
local relativepath = require( "relativepath" )

local function p( path )
   return relativepath( currentdir(), path )
end

-- test
mkdirtree{
   [ "tmp_findup" ] = {
      [ "a" ] = {
         [ "b" ] = {
            [ "c" ] = {
               [ "d" ] = {
                  [ "e" ] = {
                     [ "f" ] = {
                        [ "g" ] = {
                           [ "h" ] = {}
                        }
                     }
                  },
                  [ "foo.txt" ] = "", -- in "d"
               }
            }
         },
         [ "foo.txt" ] = "" -- in "a", will not be found
      },
      [ "b" ] = "" -- file in "tmp_findup"
   }
}

-- find file or directory
res = findup( "tmp_findup/a/b/c/d/e/f", "foo.txt" )
t( p( res ), "tmp_findup/a/b/c/d/foo.txt" )

res = findup( "tmp_findup/a/b/c/d/e/f", "b"  )
t( p( res ), "tmp_findup/a/b" )

-- find only file
res = findup( "tmp_findup/a/b/c/d/e/f/g/h", "b", "file" )
t( p( res ), "tmp_findup/b" )

-- find only directory
res = findup( "tmp_findup/a/b/c/d/e/f/g/h", "b", "directory" )
t( p( res ), "tmp_findup/a/b" )

-- restrict search depth
res = findup( "tmp_findup/a/b/c/d/e", "foo.txt", "file", 1 ) -- check parent
t( p( res ), "tmp_findup/a/b/c/d/foo.txt" )

res = findup( "tmp_findup/a/b/c/d/e", "foo.txt", "file", 0 ) -- like dirhas
t( nil, nil )

res = findup( "tmp_findup/a/b/c/d/e/f/g/h", "foo.txt", "file", 4 )
t( p( res ), "tmp_findup/a/b/c/d/foo.txt" )

res = findup( "tmp_findup/a/b/c/d/e/f/g/h", "foo.txt", "file", 3 )
t( nil, nil )

rmdirtree( "tmp_findup" )

t()
