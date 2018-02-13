local t = require( "tapered" )
local argsfilesindir = require( "argsfilesindir" )
-- util functions
local mkdirtree = require( "mkdirtree" )
local rmdirtree = require( "rmdirtree" )

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

t.ok( res )

-- test in the working dir
defargs, filepaths = argsfilesindir( "app1" )
t.is( defargs, "app1.auto.args" )
t.is( filepaths, nil )

defargs, filepaths = argsfilesindir( "xxx" )
t.is( defargs, nil )
t.is( filepaths, nil )

-- test subfolder
defargs, filepaths = argsfilesindir( "app1", "subfolder" )
t.is( defargs, "app1.auto.args" )
t.same( filepaths, { "app1.args", "app1.var1.args" } )

defargs, filepaths = argsfilesindir( "aaa", "subfolder" )
t.is( defargs, nil )
t.same( filepaths, { "aaa.var.args" } )

defargs, filepaths = argsfilesindir( "zzz", "subfolder" )
t.is( defargs, "zzz.auto.args" )
t.is( filepaths, nil )

-- teardown
os.remove( "app1.auto.args" )
t.ok( rmdirtree( "subfolder" ) )

t.done()
