--ZFUNC-tanh-v1
local function tanh( x ) --> res
   --ZFUNC-cosh-v1
   local function cosh( x )
      return ( math.exp( x ) + math.exp( -x ) ) / 2
   end

   --ZFUNC-sinh-v1
   local function sinh( x )
      return ( math.exp( x ) - math.exp( -x ) ) / 2
   end

   return sinh( x ) / cosh( x )
end

return tanh
