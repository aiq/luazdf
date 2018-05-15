--ZFUNC-selectif-v1
local function selectif( tab, fv ) --> selection
   local selection = {}

   for i, v in ipairs( tab ) do
      if fv( v ) then table.insert( selection, v ) end
   end

   return selection
end

return selectif
