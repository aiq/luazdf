local t = require( "tapered" )
local getoptvalues = require( "getoptvalues" )

args = { "--add", "1", "2", "3", "--sub", "3", "123" }

opt, values, rest = getoptvalues( args )
t.is( opt, "--add" )
t.same( values, { "1", "2", "3" } )
t.same( rest, { "--sub", "3", "123" } )

opt, values, rest = getoptvalues( args, "--add" )
t.is( opt, "--add" )
t.same( values, { "1", "2", "3" } )
t.same( rest, { "--sub", "3", "123" } )

opt, values, rest = getoptvalues( args, "--add", 1 )
t.is( opt, "--add" )
t.same( values, { "1" } )
t.same( rest, { "2", "3", "--sub", "3", "123" } )

opt, values, rest = getoptvalues( args, "--add", 2 )
t.is( opt, "--add" )
t.same( values, { "1", "2" } )
t.same( rest, { "3", "--sub", "3", "123" } )

opt, values, rest = getoptvalues( args, "--add", 5 )
t.is( opt, "--add" )
t.same( values, { "1", "2", "3" } )
t.same( rest, { "--sub", "3", "123" } )

opt, values, rest = getoptvalues( args, "--div" )
t.is( opt, nil )
t.is( #values, 0 )
t.is( args, rest )

opt, values, rest = getoptvalues( { "-a", "x", "y" }, "-a", 5 )
t.is( opt, "-a" )
t.same( values, { "x", "y" } )
t.same( rest, {} )

t.done()
