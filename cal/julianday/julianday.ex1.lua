local t = require( "taptest" )
local julianday = require( "julianday" )

-- should work like http://aa.usno.navy.mil/data/docs/JulianDate.php at 12:00:00
t( julianday( 1, 1, 1 ), 1721424 )
t( julianday( 333, 1, 27 ), 1842713 )
t( julianday( 1582, 10, 4 ),2299160 )

t( julianday( 1582, 10, 15 ), 2299161 )
t( julianday( 1900, 1, 1 ), 2415021 )
t( julianday( 1990, 1, 1 ), 2447893 )

t( julianday( 2000, 1, 1 ), 2451545 )
t( julianday( 2006, 1, 14 ), 2453750 )
t( julianday( 2010, 3, 25 ), 2455281 )
t( julianday( 2014, 5, 20 ), 2456798 )

t()
