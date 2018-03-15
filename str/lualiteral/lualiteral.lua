--ZFUNC-lualiteral-v0
local function lualiteral( value, alias ) --> str
   --TODO
   -- export ???
   local function atomdump( val )
      local t = type( val )
      if "nil" == t then
         return 'nil'
      elseif "number" == t then
         return tostring( val )
      elseif "boolean" == t then
         return tostring( val )
      elseif "string" ~= t then
         val = tostring( val )
      end
      return string.format( "%q", val )
   end

   local function lualiteral_rec( cur, alias, result )

      if "table" ~= type( cur ) then
         table.insert( result, atomdump( cur ) )
      else

      -- If a table alias is defined, use that name
      local substitute
      if alias then substitute = alias[ cur ] end
      if substitute then
         table.insert( result, substitute )
      else

         -- Recurse over each key and each value
         table.insert( result, "{" )
         for k, v in pairs( cur ) do
            table.insert( result, "[" )
            lualiteral_rec( k, alias, result )
            table.insert( result, "]=" )
            lualiteral_rec( v, alias, result )
            table.insert( result, "," )
         end
         table.insert( result, "}" )
         end
      end

      return result
   end

   local result = lualiteral_rec( value, alias, {} )
   return table.concat( result )
end

return lualiteral

