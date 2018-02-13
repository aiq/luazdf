--ZFUNC-delimiter-v1
local function delimiter() --> deli
   --ZFUNC-separator-v1
   local function separator()
      return _G.package.config:sub( 1, 1 )
   end

   if separator() == "/" then
      return ":"
   else
      return ";"
   end
end

return delimiter
