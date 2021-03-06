--ZFUNC-flyweightstore-v0
local function flyweightstore() --> ( ... ) --> reference

   local NIL, NAN = {}, {}

   local meta = {
      __index = function()
         error( "Can not access interned content directly.", 2 )
      end,
      __newindex = function()
         error( "Can not change or add content to a flyweight store.", 2 )
      end,
   }

   local internstore = setmetatable( {}, { __mode = "kv" } )

   -- A map from child to parent is used to protect the internstore table's
   -- contents.
   -- In this way, they will he collected only when all the cildren are
   -- collected in turn.
   local parent = setmetatable( {}, { __mode = "k" } )

   return function( ... )
      local currentstore = internstore
      for a = 1, select( "#", ... ) do

         -- Get next intern field. Replace un-storable contents.
         local tonext = select( a, ... )
         if tonext ~= tonext then tonext = NAN end
         if tonext == nil then tonext = NIL end

         -- Get or create the correspondent sub-intern
         local substore = rawget( currentstore, tonext )
         if substore == nil then

            substore = setmetatable( {}, meta )
            parent[ substore ] = currentstore
            rawset( currentstore, tonext, substore )
         end

         currentstore = substore
      end
      return currentstore
   end
end

local tuplefact = flyweightstore()

--ZFUNC-tuple-v0
local function tuple( ... ) --> tupleTable
   local tupleTable = tuplefact( ... )
   if not getmetatable( tupleTable ).__type then -- First time initialization

      -- Store fields
      local fields = { ... }
      fields.n = select( "#", ... )

      -- Dispatch to the stored fields, and forbid modification
      setmetatable( tupleTable, {
         type = "tuple",
         __index = function( t, k ) return fields[k] end,
         __newindex = function( t, k )
            return error( "can not change tuple field", 2 )
         end,
      } )

   end
   return tupleTable
end

return tuple

