--ZFUNC-csch-v1
local function csch( x ) --> res
   --ZFUNC-sinh-v1
   local function sinh( x )
      return ( math.exp( x ) - math.exp( -x ) ) / 2
   end

   return 1 / sinh( x )
end

return csch
