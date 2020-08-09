local t = require( "taptest" )
local gregdate = require( "gregdate" )

-- should work like the inverse from julian_day
greg = gregdate( 1721424 )
t( greg.year, 1 )
t( greg.month, 1 )
t( greg.day, 1 )

greg = gregdate( 1842713 )
t( greg.year, 333 )
t( greg.month, 1 )
t( greg.day, 27 )
      
greg = gregdate( 2299160 )
t( greg.year, 1582 )
t( greg.month, 10 )
t( greg.day, 4 )

greg = gregdate( 2299161 )
t( greg.year, 1582 )
t( greg.month, 10 )
t( greg.day, 15 )
      
greg = gregdate( 2415021 )
t( greg.year, 1900 )
t( greg.month, 1 )
t( greg.day, 1 )
      
greg = gregdate( 2447893 )
t( greg.year, 1990 )
t( greg.month, 1 )
t( greg.day, 1 )

greg = gregdate( 2451545 )
t( greg.year, 2000 )
t( greg.month, 1 )
t( greg.day, 1 )
      
greg = gregdate( 2453750 )
t( greg.year, 2006 )
t( greg.month, 1 )
t( greg.day, 14 )
      
greg = gregdate( 2455281 )
t( greg.year, 2010 )
t( greg.month, 3 )
t( greg.day, 25 )
      
greg = gregdate( 2456798 )
t( greg.year, 2014 )
t( greg.month, 5 )
t( greg.day, 20 )

t()
