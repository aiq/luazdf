--ZFUNC-gregdate-v1
local function gregdate( julianday ) --> greg
   local greg = {}

   local a = 0
   if ( julianday >= 2299161 ) then
      g = math.floor( ( julianday - 1867216.25 ) / 36524.25 )
      a = julianday + 1 + g - math.floor( g / 4 )
   else
      a = julianday
   end

   local b = a + 1524
   local c = math.floor( ( b - 122.1 ) / 365.25 )
   local d = math.floor( 365.25 * c )
   local e = math.floor( ( b - d ) / 30.6001 )

   greg.day = b - d - math.floor( 30.6001 * e )
   
   if e < 14 then
      greg.month = e - 1
   else
      greg.month = e - 13
   end

   if greg.month > 2 then
      greg.year = c - 4716
   else
      greg.year = c - 4715
   end

   return greg
end

return gregdate
