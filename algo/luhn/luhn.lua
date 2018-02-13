--ZFUNC-luhn-v1
local function luhn( numstr )
   local add = function( a, b )
      return tonumber( a ) + tonumber( b )
   end

   numstr = string.reverse( numstr )

   local sum = 0

   for i = 1, #numstr do
      if ( i % 2 == 0 ) then
         local doubled = numstr:sub( i, i ) * 2
         doubled = string.gsub( doubled, '(%d)(%d)', add )
         sum = sum + tonumber( doubled )
      else
         sum = sum + tonumber( numstr:sub( i, i ) )
      end
   end
  
   if ( sum % 10 ) == 0 then return true else return false end
end

return luhn
