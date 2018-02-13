--ZFUNC-extname-v1
local function extname( path ) --> ext
   local i = #path
   local c = string.sub( path, i, i )
   while i > 0 and c ~= "." do
      i = i - 1
      c = string.sub( path, i, i )
      if c == "/" then return "" end
   end

   if i == 0 then return "" end -- empty path

   return string.sub( path, i )
end

return extname
