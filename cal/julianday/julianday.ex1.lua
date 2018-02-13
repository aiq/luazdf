local t = require( "tapered" )
local julianday = require( "julianday" )

-- should work like http://aa.usno.navy.mil/data/docs/JulianDate.php at 12:00:00
t.is( 1721424, julianday( 1, 1, 1 ) )
t.is( 1842713, julianday( 333, 1, 27 ) )
t.is( 2299160, julianday( 1582, 10, 4 ) )

t.is( 2299161, julianday( 1582, 10, 15 ) )
t.is( 2415021, julianday( 1900, 1, 1 ) )
t.is( 2447893, julianday( 1990, 1, 1 ) )

t.is( 2451545, julianday( 2000, 1, 1 ) )
t.is( 2453750, julianday( 2006, 1, 14 ) )
t.is( 2455281, julianday( 2010, 3, 25 ) )
t.is( 2456798, julianday( 2014, 5, 20 ) )

t.done()
