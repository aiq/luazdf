--ZFUNC-lcm-v1
local function lcm( x, ... ) --> res
   local function pgcd( m, n )
      while m ~= 0 do
         m, n = n % m, m
      end
      return n
   end

   local function plcm( m, n )
      if m ~= 0 and n~= 0 then
         return m * n / pgcd( m, n )
      else
         return 0
      end
   end

   local res = math.floor( x )
   for _, n in ipairs{ ... } do
      if n < 0 then return math.sqrt( -1 ) end
      res = plcm( res, math.floor( n ) )
   end

   return res
end

return lcm
