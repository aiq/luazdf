--ZFUNC-getin-v1
local function getin( tab, ... ) --> val
   local path = { ... }

   local val = tab
   for i, v in ipairs( path ) do
      val = val[ v ]
      if not val then
         return nil
      end
   end

   return val
end

return getin
