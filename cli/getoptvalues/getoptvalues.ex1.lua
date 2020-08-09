local t = require( "taptest" )
local getoptvalues = require( "getoptvalues" )
local same = require( "same" )

args = { "--add", "1", "2", "3", "--sub", "3", "123" }

opt, values, rest = getoptvalues( args )
t( opt, "--add" )
t( same( values, { "1", "2", "3" } ), true )
t( same( rest, { "--sub", "3", "123" } ), true )

opt, values, rest = getoptvalues( args, "--add" )
t( opt, "--add" )
t( same( values, { "1", "2", "3" } ), true )
t( same( rest, { "--sub", "3", "123" } ), true )

opt, values, rest = getoptvalues( args, "--add", 1 )
t( opt, "--add" )
t( same( values, { "1" } ), true )
t( same( rest, { "2", "3", "--sub", "3", "123" } ), true )

opt, values, rest = getoptvalues( args, "--add", 2 )
t( opt, "--add" )
t( same( values, { "1", "2" } ), true )
t( same( rest, { "3", "--sub", "3", "123" } ), true )

opt, values, rest = getoptvalues( args, "--add", 5 )
t( opt, "--add" )
t( same( values, { "1", "2", "3" } ), true )
t( same( rest, { "--sub", "3", "123" } ), true )

opt, values, rest = getoptvalues( args, "--div" )
t( opt, nil )
t( #values, 0 )
t( args, rest )

opt, values, rest = getoptvalues( { "-a", "x", "y" }, "-a", 5 )
t( opt, "-a" )
t( same( values, { "x", "y" } ), true )
t( same( rest, {} ), true )

t()
