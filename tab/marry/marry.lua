--ZFUNC-marry-v1
local function marry( keys, values ) --> tab
   local tab = {}

   if #keys ~= #values then
      return nil
   end

   for i = 1, #keys do
      local k = keys[ i ]
      local v = values[ i ]
      tab[ k ] = v
   end

   return tab
end

return marry
