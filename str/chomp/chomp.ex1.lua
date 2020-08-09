local t = require( "taptest" )
local chomp = require( "chomp" )

t( chomp( "hello" ), "hello" )
t( chomp( "hello\n" ), "hello" )
t( chomp( "hello\r\n" ), "hello" )
t( chomp( "hello\n\r" ), "hello" )
t( chomp( "hello\r" ), "hello" )
t( chomp( "hello \n there" ), "hello \n there" )
t( chomp( "hello\r\n\r\n" ), "hello" )

t()
