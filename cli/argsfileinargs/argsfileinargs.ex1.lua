local t = require( "tapered" )
local argsfileinargs = require( "argsfileinargs" )

filepath, idx, args = argsfileinargs{ "opt1", "--args", "xxx.args", "opt2" }
t.is( filepath, "xxx.args" )
t.is( idx, 2 )
t.same( args, { "opt1", "opt2" } )

filepath, idx, args = argsfileinargs( args )
t.is( filepath, nil )
t.is( idx, nil )
t.same( args, { "opt1", "opt2" } )

t.done()
