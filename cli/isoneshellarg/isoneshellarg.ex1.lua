local t = require( "tapered" )
local isoneshellarg = require( "isoneshellarg" )

t.ok( isoneshellarg( "-sd" ) )
t.ok( isoneshellarg( "'hello world'" ) )

t.nok( isoneshellarg( "one two" ) )
t.nok( isoneshellarg( "'on" ) )

t.done()
