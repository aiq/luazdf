local t = require( "taptest" )
local argsfilesindir = require( "argsfilesindir" )
local like = require( "like" )
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )
local same = require( "same" )

-- setup
res, err = mkdirtree{
   [ "app1.auto.args" ] = "",
   [ "subfolder" ] = {
      [ "app1.auto.args" ] = "",
      [ "app1.args" ] = "",
      [ "app1.var1.args" ] = "",
      [ "aaa.var.args" ] = "",
      [ "zzz.auto.args" ] = ""
   }
}

t( res,true )

-- test in the working dir
defargs, filepaths = argsfilesindir( "app1" )
t( defargs, "app1.auto.args" )
t( filepaths, nil )

defargs, filepaths = argsfilesindir( "xxx" )
t( defargs, nil )
t( filepaths, nil )

-- test subfolder
defargs, filepaths = argsfilesindir( "app1", "subfolder" )
t( defargs, "app1.auto.args" )
t( like( filepaths, { "app1.args", "app1.var1.args" } ), true )

defargs, filepaths = argsfilesindir( "aaa", "subfolder" )
t( defargs, nil )
t( same( filepaths, { "aaa.var.args" } ), true )

defargs, filepaths = argsfilesindir( "zzz", "subfolder" )
t( defargs, "zzz.auto.args" )
t( filepaths, nil )

-- teardown
os.remove( "app1.auto.args" )
t( rmdirtree( "subfolder" ), true )

t()
