--ZFUNC-select-v1
local function select( tab, fv ) --> selection
   local selection = {}

   for i, v in ipairs( tab ) do
      if fv( v ) then table.insert( selection, v ) end
   end

   return selection
end

return select
