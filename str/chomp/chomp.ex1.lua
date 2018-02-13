local t = require( "tapered" )
local chomp = require( "chomp" )

t.is( "hello", chomp( "hello" ) )
t.is( "hello", chomp( "hello\n" ) )
t.is( "hello", chomp( "hello\r\n" ) )
t.is( "hello", chomp( "hello\n\r" ) )
t.is( "hello", chomp( "hello\r" ) )
t.is( "hello \n there", chomp( "hello \n there" ) )
t.is( "hello", chomp( "hello\r\n\r\n" ) )

t.done()
