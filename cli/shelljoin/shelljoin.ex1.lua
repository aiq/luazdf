local t = require( "taptest" )
local shelljoin = require( "shelljoin" )

line = shelljoin{ "here", "are", "two words" }
t( 'here are "two words"', line )

line = shelljoin{ "John", "says", 'Hello"s World' }
t( 'John says "Hello\\"s World"', line )

t()
