local t = require( "taptest" )
local findbyte = require( "findbyte" )

local b = string.byte

t( findbyte( "image.png", b'.' ), 6 )
t( findbyte( "foo-bar-tar", b'-', 5 ), 8 )
t( findbyte( "abcdefgh", b'x' ), nil )

t()
