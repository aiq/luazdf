local t = require( "tapered" )
local getoptpair = require( "getoptpair" )

args = { "--mode=safe", "-l" }

opt, val, rest = getoptpair( args )
t.is( opt, "--mode" )
t.is( val, "safe" )
t.same( rest, { "-l" } )

opt, val, rest = getoptpair( args, "--mode" )
t.is( opt, "--mode" )
t.is( val, "safe" )
t.same( rest, { "-l" } )

opt, val, rest = getoptpair( args, "--file" )
t.is( opt, nil )
t.is( val, nil )
t.same( rest, args )

t.done()
