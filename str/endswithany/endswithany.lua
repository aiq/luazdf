--ZFUNC-endswithany-v1
local function endswithany( str, tab ) --> res
   for _, v in ipairs( tab ) do
      local sub = string.sub( str, -string.len( v ) )
      if sub == v then
         return true
      end
   end

   return false
end

return endswithany
