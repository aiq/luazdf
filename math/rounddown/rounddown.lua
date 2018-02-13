--ZFUNC-rounddown-v1
local function rounddown( x, n ) --> res
   if x > 0 then
      return math.floor( x * math.pow( 10, n ) ) / math.pow( 10, n )
   else
      return math.ceil( x * math.pow( 10, n ) ) / math.pow( 10, n )
   end
end

return rounddown
