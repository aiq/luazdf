--ZFUNC-select-v1
--TODO select is a function in the standard library
local function select( tab, fv ) --> selection
   local selection = {}

   for i, v in ipairs( tab ) do
      if fv( v ) then table.insert( selection, v ) end
   end

   return selection
end

return select
