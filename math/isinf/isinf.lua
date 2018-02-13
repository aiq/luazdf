--ZFUNC-isinf-v1
local function isinf( x ) --> res
   return x == math.huge or x == -math.huge
end

return isinf
