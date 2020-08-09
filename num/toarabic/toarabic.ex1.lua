local t = require( "taptest" )
local toarabic = require( "toarabic" )

t( toarabic( "LVII" ), 57 )
t( toarabic( "MDCLXVI" ), 1666 )
t( toarabic( "mcmxii" ), 1912 )
t( toarabic( "MCMXC" ), 1990 )
t( toarabic( "MMVIII" ), 2008 )

t( toarabic( "CDXCIX" ), 499 )
t( toarabic( "LDVLIV" ), 499 )
t( toarabic( "XDIX" ), 499 )
t( toarabic( "VDIV" ), 499 )
t( toarabic( "ID" ), 499 )

t( toarabic( "ROMAN" ), nil )

t()
