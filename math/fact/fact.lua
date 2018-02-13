--ZFUNC-fact-v1
local function fact( x ) --> res
   if x < 0 then return math.sqrt( x ) end
   x = math.floor( x )

   if x == 0 then
      return 1
   else
      return x * fact( x-1 )
   end
end

return fact
