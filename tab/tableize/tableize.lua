--ZFUNC-tableize-v1
local function tableize( val ) --> tab
   if type( val ) == "table" then
      return val
   else
      return { val }
   end
end

return tableize
