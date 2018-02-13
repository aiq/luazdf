--ZFUNC-isfinite-v1
local function isfinite( x ) --> res
   return x > -math.huge and x < math.huge
end

return isfinite
