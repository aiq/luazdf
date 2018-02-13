--ZFUNC-iseven-v1
local function iseven( num ) --> res
   return math.fmod( num, 2 ) == 0
end

return iseven
