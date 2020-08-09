local t = require( "taptest" )
local frombase2 = require( "frombase2" )

-- reads data from a bitfields string
t( frombase2( "01000001010000110100010001000011" ), "ACDC" )
   
-- read data  with o instead of 0
t( frombase2( "o1ooooo1o1oooo11" ), "AC" )
t( frombase2( "OioooooiOiooooii" ), "AC" )

-- allows to ignore characters in a bitfield string
t( frombase2( "o1ooooo1 o1oooo11", " " ), "AC" )
   
-- handles wrong characters without a crash
local res, err = frombase2( "o1oo*ooo1*o1oo*oo11" )
t( res, nil )
t( err, "unexpected character at position 5: '*'" )

t()
