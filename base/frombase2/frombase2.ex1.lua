local t = require( "tapered" )
local frombase2 = require( "frombase2" )

-- reads data from a bitfields string
t.is( frombase2( "01000001010000110100010001000011" ), "ACDC" )
   
-- read data  with o instead of 0
t.is( frombase2( "o1ooooo1o1oooo11" ), "AC" )
t.is( frombase2( "OioooooiOiooooii" ), "AC" )

-- allows to ignore characters in a bitfield string
t.is( frombase2( "o1ooooo1 o1oooo11", " " ), "AC" )
   
-- handles wrong characters without a crash
local res, err = frombase2( "o1oo*ooo1*o1oo*oo11" )
t.nok( res )
t.is( err, "unexpected character at position 5: '*'" )

t.done()
