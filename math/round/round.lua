--ZFUNC-round-v1
local function round( x, n ) --> res
   if x > 0 then
      return math.floor( x * math.pow( 10, n ) + 0.5 ) / math.pow( 10, n )
   else
      return math.ceil( x * math.pow( 10, n ) - 0.5 ) / math.pow( 10, n )
   end
end

return round
