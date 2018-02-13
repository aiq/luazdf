--ZFUNC-sech-v1
local function sech( x ) --> res
   --ZFUNC-cosh-v1
   local function cosh( x )
      return ( math.exp( x ) + math.exp( -x ) ) / 2
   end

   return 1 / cosh( x )
end

return sech
