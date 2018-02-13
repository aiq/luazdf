--ZFUNC-inrange-v1
local function inrange( num, min, max ) --> res
   if num >= min and num <= max then
      return true
   else
      return false
   end
end

return inrange
