local t = require( "tapered" )
local shelljoin = require( "shelljoin" )

line = shelljoin{ "here", "are", "two words" }
t.is( 'here are "two words"', line )

line = shelljoin{ "John", "says", 'Hello"s World' }
t.is( 'John says "Hello\\"s World"', line )

t.done()
