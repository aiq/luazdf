--ZFUNC-buildset-v1
local function buildset( arr )
   local res = {}
   for _, v in ipairs( arr ) do res[ v ] = true end
   return res
end

return buildset
