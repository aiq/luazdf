--ZFUNC-pluck-v1
local function pluck( tabs, key )
   local res = {}

   for i, v in ipairs( tabs ) do
      table.insert( res, v[ key ] )
   end

   return res
end

return pluck
