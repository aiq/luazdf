--ZFUNC-partial-v1
local function partial( f, ... ) --> mfunc
   --ZFUNC-append-v1
   local function append( arr, v, ... )
      table.insert( arr, v )
      if ... then
         for i, o in ipairs{ ... } do
            table.insert( arr, o )
         end
      end
      return arr
   end
   --ZFUNC-unwrap-v1
   local function unwrap( tab, i, j )
      local unpack = unpack or table.unpack
      return unpack( tab, i, j )
   end

   local args = { ... }
   return function( ... )
      return f( unwrap( append( args, ... ) ) )
   end
end

return partial
