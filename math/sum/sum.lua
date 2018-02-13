--ZFUNC-sum-v1
local function sum( x, ... ) --> res
   local res = x
   for _, v in ipairs{ ... } do
      res = res + v
   end
   return res
end

return sum
