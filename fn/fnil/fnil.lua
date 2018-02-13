--ZFUNC-fnil-v1
local function fnil( f, ... ) --> mf
   --ZFUNC-unwrap-v1
   local function unwrap( tab, i, j )
      local unpack = unpack or table.unpack
      return unpack( tab, i, j )
   end

   local defaults = { ... }

   return function ( ... )
      local args = { ... }
      local merged = {}
      
      for i, v in ipairs( defaults ) do
         local arg = args[ i ]
         if arg ~= nil then
            table.insert( merged, arg )
         else
            table.insert( merged, v )
         end
      end

      return f( unwrap( merged ) )
   end
end

return fnil
