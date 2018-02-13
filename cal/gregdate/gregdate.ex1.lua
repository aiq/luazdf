local t = require( "tapered" )
local gregdate = require( "gregdate" )

-- should work like the inverse from julian_day
greg = gregdate( 1721424 )
t.is( 1, greg.year )
t.is( 1, greg.month )
t.is( 1, greg.day )

greg = gregdate( 1842713 )
t.is( 333, greg.year )
t.is( 1, greg.month )
t.is( 27, greg.day )
      
greg = gregdate( 2299160 )
t.is( 1582, greg.year )
t.is( 10, greg.month )
t.is( 4, greg.day )

greg = gregdate( 2299161 )
t.is( 1582, greg.year )
t.is( 10, greg.month )
t.is( 15, greg.day )
      
greg = gregdate( 2415021 )
t.is( 1900, greg.year )
t.is( 1, greg.month )
t.is( 1, greg.day )
      
greg = gregdate( 2447893 )
t.is( 1990, greg.year )
t.is( 1, greg.month )
t.is( 1, greg.day )

greg = gregdate( 2451545 )
t.is( 2000, greg.year )
t.is( 1, greg.month )
t.is( 1, greg.day )
      
greg = gregdate( 2453750 )
t.is( 2006, greg.year )
t.is( 1, greg.month )
t.is( 14, greg.day )
      
greg = gregdate( 2455281 )
t.is( 2010, greg.year )
t.is( 3, greg.month )
t.is( 25, greg.day )
      
greg = gregdate( 2456798 )
t.is( 2014, greg.year )
t.is( 5, greg.month )
t.is( 20, greg.day )

t.done()
