--ZFUNC-asinh-v1
local function asinh( x ) --> res
   return math.log( x + math.sqrt( x * x + 1 ) )
end

return asinh
