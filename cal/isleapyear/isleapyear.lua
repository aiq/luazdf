--ZFUNC-isleapyear-v1
local function isleapyear( year ) --> res
   if( year % 4 == 0 and year % 100 ~= 0 ) or ( year % 400 == 0 ) then 
      return true
   else
      return false
   end
end

return isleapyear
