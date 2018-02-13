--ZFUNC-cosh-v1
local function cosh( x ) --> res
   return ( math.exp( x ) + math.exp( -x ) ) / 2
end

return cosh
