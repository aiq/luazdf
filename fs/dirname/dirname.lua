--ZFUNC-dirname-v1
local function dirname( path ) --> parent

   local i = #path
   local c = string.sub( path, i, i )
   if c == "/" and #path >= 1 then
      i = i - 1
      c = string.sub( path, i, i )
   end
   
   while i > 0 and c ~= "/" do
      i = i - 1
      c = string.sub( path, i, i )
   end

   if i == 0 then 
      return path
   elseif i == 1 then -- root case
      return string.sub( path, 1, 1 )
   else
      return string.sub( path, 1, i-1 )
   end
end

return dirname
