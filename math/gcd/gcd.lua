--ZFUNC-gcd-v1
local function gcd( x, ... ) --> res
   local function pgcd( m, n )
      while m ~= 0 do
         m, n = n % m, m
      end
      return n
   end

   local res = math.floor( x )
   for _, n in ipairs{ ... } do
      if n < 0 then return math.sqrt( -1 ) end
      res = pgcd( res, math.floor( n ) )
   end

   return res
end

return gcd
