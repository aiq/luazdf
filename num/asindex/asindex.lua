--ZFUNC-asindex-v1
local function asindex( i, length, fit ) --> idx
   --ZFUNC-clamp-v1
   local function clamp( num, min, max )
      if num < min then return min
      elseif num > max then return max
      else return num
      end
   end

   if i < 0 then i = length + i + 1 end

   if fit then
      return clamp( i, 1, length )
   end

   return i
end

return asindex
