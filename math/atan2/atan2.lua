--ZFUNC-atan2-v1
local function atan2( y, x ) --> res
   local q = math.atan( y / x )
   if x >= 0 then return q end

   if q <= 0 then return q + math.pi
   else return q - math.pi
   end
end

return atan2
