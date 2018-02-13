--ZFUNC-longextname-v1
local function longextname( path ) --> ext
   local i = #path
   local doti = nil
   local c = string.sub( path, i, i )
   while i > 0 and c ~= "/" do
      i = i - 1
      c = string.sub( path, i, i )
      if c == "." then doti = i end
   end

   if doti then return string.sub( path, doti ) end

   return ""
end

return longextname

