local t = require( "taptest" )
local getoptpair = require( "getoptpair" )
local same = require( "same" )

args = { "--mode=safe", "-l" }

opt, val, rest = getoptpair( args )
t( opt, "--mode" )
t( val, "safe" )
t( same( rest, { "-l" } ), true )

opt, val, rest = getoptpair( args, "--mode" )
t( opt, "--mode" )
t( val, "safe" )
t( same( rest, { "-l" } ), true )

opt, val, rest = getoptpair( args, "--file" )
t( opt, nil )
t( val, nil )
t( same( rest, args ), true )

t()
