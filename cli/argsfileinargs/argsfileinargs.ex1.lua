local t = require( "taptest" )
local argsfileinargs = require( "argsfileinargs" )
local same = require( "same" )

filepath, idx, args = argsfileinargs{ "opt1", "--args", "xxx.args", "opt2" }
t( filepath, "xxx.args" )
t( idx, 2 )
t( same( args, { "opt1", "opt2" } ), true )

filepath, idx, args = argsfileinargs( args )
t( filepath, nil )
t( idx, nil )
t( same( args, { "opt1", "opt2" } ), true )

t()
