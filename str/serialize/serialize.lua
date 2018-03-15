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

local function stored_name( s )
   if not s then return "P" end
   return "P["..s.."]"
end

local function table_cut_point_rec( tab, acc )

   if not acc then
      acc = { alias = {}, stored = 0, refcount = {}, depth = 1 }
   end

   if "table" == type( tab ) then

      -- Skip if already marked as a cut point
      if acc.alias[ tab ] then return acc end

      -- Update reference counter and nest level
      local count = acc.refcount[ tab ]
      if not count then count = 0 end
      count = count + 1
      acc.refcount[ tab ] = count
      local depth = acc.depth + 1

      if count < 2    -- No multiple reference to this table
      and depth < 151 -- Below the maximum nest level allowed by lua (200)
      then
         acc.depth = depth
      else
         -- Marsk as cut point
         local store_number = acc.stored + 1
         acc.alias[ tab ] = stored_name( store_number )
         acc.stored = store_number
         acc.depth = 1
      end

      -- Recurse over each key and each value
      for key, value in pairs( tab ) do
         table_cut_point_rec( key, acc )
         table_cut_point_rec( value, acc )
      end

      acc.depth = depth - 1
   end
   return acc
end

--ZFUNC-serialize-v0
local function serialize( value ) --> str
   --TODO
   local result = {}
   local acc = table_cut_point_rec( value )

   -- Fallback to single table literal, if possible
   if acc.stored < 1 then
      return "return "..lualiteral( value, acc.alias )
   end

   -- Append the alias name definition
   table.insert( result, "local "..stored_name( ).."={}" )
   acc.stored = acc.stored + 1
   acc.alias[ value ] = stored_name( acc.stored )
   table.insert( result,
                  ";for i=1,"..acc.stored.." do "..stored_name().."[i]={}end" )

   -- Place the right keys in each alias
   for tab, alias in pairs( acc.alias ) do
      for key, value in pairs( tab ) do
         table.insert( result, ";"..alias.."[" )
         table.insert( result, lualiteral(key, acc.alias ))
         table.insert( result, "]=" )
         table.insert( result, lualiteral(value, acc.alias ))
      end
   end

   -- Return the alias of the root table
   table.insert( result, ';return '..stored_name(acc.stored ))
   return table.concat( result )
end

return serialize

