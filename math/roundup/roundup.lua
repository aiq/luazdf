--ZFUNC-roundup-v1
local function roundup( x, n ) --> res
   if x > 0 then
      return math.ceil( x * math.pow( 10, n ) ) / math.pow( 10, n )
   else
      return math.floor( x * math.pow( 10, n ) ) / math.pow( 10, n )
   end
end

return roundup
