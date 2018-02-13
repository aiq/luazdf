--ZFUNC-minmax-v1
local function minmax( x, ... ) --> min, max
   local min = x
   local max = x
   for _, v in ipairs{ ... } do
      if v < min then min = v end
      if v > max then max = v end
   end
   return min, max
end

return minmax
