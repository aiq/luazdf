--ZFUNC-tilldayofweek-v1
local function tilldayofweek( greg, target, dir ) --> days

   --ZFUNC-dayofweek-v1
   local dayofweek = function( year, month, day )   
      local century = function( year ) return math.floor( year / 100 ) end

      --ZFUNC-isleapyear-v1
      local isleapyear = function( year )
         if( year % 4 == 0 and year % 100 ~= 0 ) or ( year % 400 == 0 ) then 
            return true
         else
            return false
         end
      end

      local month_number_for_month = { 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5 }

      local day_num = day % 7
      local month_num = month_number_for_month[ month ]

      local y = year - century( year ) * 100
      local year_num = ( y + math.floor( y / 4 ) ) % 7

      local century_num = ( 3 - ( century( year ) % 4 ) ) * 2

      local leap_num = 0
      if ( isleapyear( year ) and ( month < 3 ) ) then leap_num = 6 end

      local res = day_num + month_num + year_num + century_num + leap_num - 1
      return ( res % 7 ) + 1
   end

   local last_dayofweek = function( current, target )
      if target < current then
         return target - current
      else
         return -7 + ( target - current )
      end
   end

   local next_dayofweek = function( current, target )
      if target > current then
         return target - current
      else
         return 7 + ( target - current )
      end
   end

   local dow = dayofweek( greg.year, greg.month, greg.day )
   if dir < 0 then
      local diff = last_dayofweek( dow, target )
      return 7 * ( dir + 1 ) + diff
   else
      local diff = next_dayofweek( dow, target )
      return 7 * ( dir - 1 ) + diff
   end
end

return tilldayofweek
