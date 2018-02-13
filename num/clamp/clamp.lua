--ZFUNC-clamp-v1
local function clamp( num, min, max ) --> res
   if num < min then return min
   elseif num > max then return max
   else return num
   end
end

return clamp
