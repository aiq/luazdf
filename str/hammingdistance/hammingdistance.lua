--ZFUNC-hammingdistance-v1
local function hammingdistance( a, b ) --> distance, err
   if #a ~= #b then return nil, "strings must be of the same length" end

   local distance = 0
   for i = 1, #a do
      if string.byte( a, i ) ~= string.byte( b, i ) then
         distance = distance+1
      end
   end

   return distance
end

return hammingdistance
