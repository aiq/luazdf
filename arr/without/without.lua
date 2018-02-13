--ZFUNC-without-v1
local function without( tab, ... ) --> reduced
   local values = { ... }
   local ignore = {}
   for _, v in ipairs( values ) do
      ignore[ v ] = true
   end

   local reduced = {}
   for _, v in ipairs( tab ) do
      if not ignore[ v ] then
         table.insert( reduced, v )
      end
   end

   return reduced
end

return without
