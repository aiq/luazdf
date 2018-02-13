--ZFUNC-sinh-v1
local function sinh( x ) --> res
   return ( math.exp( x ) - math.exp( -x ) ) / 2
end

return sinh
