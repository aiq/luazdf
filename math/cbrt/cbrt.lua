--ZFUNC-cbrt-v1
local function cbrt( x ) --> res
   --ZFUNC-isinf-v1
   local function isinf( x )
      return x == math.huge or x == -math.huge
   end

   --ZFUNC-isnan-v1
   local function isnan( x )
      return x ~= x
   end

   if x == 0 or isnan( x ) or isinf( x ) then return x end

   local neg = x < 0
   x = math.abs( x )

   local res = math.exp( math.log( x ) / 3 );
   res = ( x / ( res * res ) + ( 2 * res )) / 3;

   if neg then return -res else return res end
end

return cbrt
