local t = require( "tapered" )
local toarabic = require( "toarabic" )

t.is( 57, toarabic( "LVII" ) )
t.is( 1666, toarabic( "MDCLXVI" ) )
t.is( 1912, toarabic( "mcmxii" ) )
t.is( 1990, toarabic( "MCMXC" ) )
t.is( 2008, toarabic( "MMVIII" ) )

t.is( 499, toarabic( "CDXCIX" ) )
t.is( 499, toarabic( "LDVLIV" ) )
t.is( 499, toarabic( "XDIX" ) )
t.is( 499, toarabic( "VDIV" ) )
t.is( 499, toarabic( "ID" ) )

t.is( nil, toarabic( "ROMAN" ) )

t.done()
