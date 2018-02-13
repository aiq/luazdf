--ZFUNC-digitsum-v1
local function digitsum( num ) --> sum
   local sum = 0
   while num > 0 do
      sum = sum + num % 10
      num = math.floor( num / 10 )
   end
   return sum
end

return digitsum
