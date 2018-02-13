--ZFUNC-startswithany-v1
local function startswithany( str, tab ) --> res
   for _, v in ipairs( tab ) do
      local sub = string.sub( str, 1, string.len( v ) )
      if sub == v then
         return true
      end
   end

   return false
end

return startswithany
