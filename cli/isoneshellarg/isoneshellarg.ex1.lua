local t = require( "taptest" )
local isoneshellarg = require( "isoneshellarg" )

t( isoneshellarg( "-sd" ), true )
t( isoneshellarg( "'hello world'" ), true )

t( isoneshellarg( "one two" ), false )
t( isoneshellarg( "'on" ), false )

t()
