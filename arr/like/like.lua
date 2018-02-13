--ZFUNC-like-v1
local function like( arr, other ) --> res
   local tmp = {}

   for i, v in ipairs( arr ) do
      local base = tmp[ v ] or 0
      tmp[ v ] = base + 1
   end

   for i, v in ipairs( other ) do
      local base = tmp[ v ] or 0
      tmp[ v ] = base + 1
   end

   for k, v in pairs( tmp ) do
      if v % 2 ~= 0 then
         return false
      end
   end

   return true
end

return like
