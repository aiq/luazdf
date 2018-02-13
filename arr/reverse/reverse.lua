--ZFUNC-reverse-v1
local function reverse( arr )
   local i = 1
   local j = #arr
   while i < j do
      arr[ i ], arr[ j ] = arr[ j ], arr[ i ]
      i = i+1
      j = j-1
   end
   return arr
end

return reverse
