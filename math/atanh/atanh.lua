--ZFUNC-atanh-v1
local function atanh( x ) --> res
   if x < -1 or x > 1 then return math.sqrt( -1 ) end
   return math.log( ( 1+x ) / ( 1-x ) ) / 2
end

return atanh
