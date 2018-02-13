--ZFUNC-product-v1
local function product( x, ... ) --> res
   local res = x
   for _, v in ipairs{ ... } do
      res = res * v
   end
   return res
end

return product
