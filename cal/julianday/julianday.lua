--ZFUNC-julianday-v1
local function julianday( year, month, day ) --> jd
   if year < 0 then year = year + 1 end
   if ( year > 1582 or
      ( year == 1582 and ( month > 10 or
                         ( month == 10 and day >= 15 ) ) ) ) then

      local k = math.ceil( ( month - 14 ) / 12 )
      local a = math.floor( ( year + 4800 + k ) * 365.25 )
      local b = math.floor( ( 367 * ( month - 2 - 12 * k ) ) / 12 )
      local c = math.floor( ( ( year + 4900 + k ) / 100 ) * 0.75 )

      return a + b - c + day - 32075
   elseif ( year < 1582 or
          ( year == 1582 and ( month < 10 or
                             ( month == 10 and day <= 4 ) ) ) ) then
   
      local k = math.floor( ( 14 - month ) / 12 )
      local a = math.floor( ( 153 * ( month + ( 12 * k ) - 3) + 2 ) / 5 )
      local b = math.floor( ( year + 4800 - k ) * 365.25 )

      return a + b + day - 32083;
   else
      return 0
   end
end

return julianday
