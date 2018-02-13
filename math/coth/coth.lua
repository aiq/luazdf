--ZFUNC-coth-v1
local function coth( x ) --> res
   --ZFUNC-tanh-v1
   local function tanh( x )
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

   return 1 / tanh( x );
end

return coth
