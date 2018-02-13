--ZFUNC-fact2-v1
local function fact2( x ) --> res
   if x < 0 then return math.sqrt( x ) end
   x = math.floor( x )

   if x == 0 or x == 1 then
      return 1
   else
      return x * fact2( x-2 )
   end
end

return fact2
