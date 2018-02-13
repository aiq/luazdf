--ZFUNC-splice-v1
local function splice( tab, idx, n, ... ) --> removed
   local values = { ... }
   local init_tab_size = #tab

   local removed = {}
   if n > 0 then
      for i = idx, ( idx + n - 1 ) do
         table.insert( removed, tab[ i ] )
         tab[ i ] = nil
      end
   end

   local tail = {}
   for i = ( idx + n ), init_tab_size do
      table.insert( tail, tab[ i ] )
      tab[ i ] = nil
   end

   local i = idx
   for _, v in ipairs( values ) do
      tab[ i ] = v
      i = i + 1
   end

   i = idx + #values
   for _, v in ipairs( tail ) do
      tab[ i ] = v
      i = i + 1
   end

   return removed
end

return splice
