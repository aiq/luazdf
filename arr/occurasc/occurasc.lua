--ZFUNC-occurasc-v1
local function occurasc( arr, ... )
   local subarr = { ... }
   local i = 1
   local n = #subarr
   if n == 0 then return true end

   for _, v in ipairs( arr ) do
      if v == subarr[ i ] then
         i = i+1
         if i > n then return true end
      end
   end
   return false
end

return occurasc
