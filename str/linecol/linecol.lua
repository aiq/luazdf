--ZFUNC-linecol-v1
local function linecol( str, idx ) --> line, col
   --ZFUNC-asindex-v1
   local function asindex( i, length, fit )
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

   local n = #str
   if n < idx then idx = n
   elseif n < 1 then idx = 1
   end

   idx = asindex( idx, #str, true )

   local line = 1
   local col = 1

   for i = 1, idx-1 do
      if string.sub( str, i, i ) == "\n" then
         line = line + 1
         col = 1
      else
         col = col + 1
      end
   end

   return line, col
end

return linecol
