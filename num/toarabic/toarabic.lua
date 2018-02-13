--ZFUNC-toarabic-v1
local function toarabic( roman ) --> num
   local value_map = { M=1000, D=500, C=100, L=50, X=10, V=5, I=1 }
   local num = 0    
 
   local i = 1
   roman = string.upper( roman )
   local strlen = #roman
   while i < strlen do
      local z1 = value_map[ string.sub( roman, i, i ) ]
      local z2 = value_map[ string.sub( roman, i + 1, i + 1 ) ]

      if not z1 or not z2 then return nil end
   
      if z1 < z2 then
         num = num + ( z2 - z1 )
         i = i + 2
      else
         num = num + z1
         i = i + 1    
      end        
   end
 
   if i <= strlen then num = num + value_map[ string.sub( roman, i, i ) ] end
 
   return num    
end

return toarabic
