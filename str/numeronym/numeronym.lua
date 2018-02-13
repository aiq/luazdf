--ZFUNC-numeronym-v1
local function numeronym( str ) --> nstr
   local char_str = function( str )
      local tab = {}

      for i = 1, #str do
         local c = str:sub( i, i )
         if c ~= " " then
            table.insert( tab, c )
         end
      end

      return table.concat( tab )
   end

   local s = char_str( str )
   local len = #s
   if len < 4 then return str end

   local tab = {}
   table.insert( tab, s:sub( 1, 1 ) )
   table.insert( tab, tostring( len - 2 ) )
   table.insert( tab, s:sub( len, len ) )
   return table.concat( tab )
end

return numeronym
